import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';
import 'local/database.dart';
import '../domain/models/profile_model.dart';
import 'repositories/local_repository_impl.dart';
import '../sync/sync_engine.dart';

class UserRepository {
  final Dio _dio;
  final LocalRepositoryImpl _localRepo;
  final SyncEngine _syncEngine;

  UserRepository(this._dio, this._localRepo, this._syncEngine);

  Future<Map<String, dynamic>?> searchUserByPhone(String phone) async {
    try {
      final response = await _dio.get('/users/search', queryParameters: {'phone': phone});
      return response.data;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<void> updateProfile({String? displayName, String? email}) async {
    try {
      // 1. Save optimistic update to local repo
      final profile = await _localRepo.getProfile('current_user') ??
          ProfileModel(
            id: 'current_user',
            displayName: displayName,
            email: email,
            role: 'user',
          );

      await _localRepo.saveProfile(profile.copyWith(
        displayName: displayName ?? profile.displayName,
        email: email ?? profile.email,
        localUpdatedAt: DateTime.now(),
        syncState: 'pending',
      ));

      // 2. Enqueue offline action instead of making direct remote call
      await _syncEngine.enqueueOperation(
        'update',
        'profile',
        'current_user',
        {
          if (displayName != null) 'display_name': displayName,
          if (email != null) 'email': email,
        }
      );

      // Optionally trigger sync immediately
      _syncEngine.sync();
    } catch (e) {
      rethrow;
    }
  }
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final localRepositoryProvider = Provider<LocalRepositoryImpl>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalRepositoryImpl(db);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  final localRepo = ref.watch(localRepositoryProvider);
  final syncEngine = ref.watch(syncEngineProvider.notifier);
  return UserRepository(dio, localRepo, syncEngine);
});
