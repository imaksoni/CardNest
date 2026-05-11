import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';
import 'local/database.dart';
import '../domain/models/profile_model.dart';
import 'repositories/local_repository_impl.dart';

class UserRepository {
  final Dio _dio;
  final LocalRepositoryImpl _localRepo;

  UserRepository(this._dio, this._localRepo);

  Future<void> updateProfile({String? displayName, String? email}) async {
    try {
      final response = await _dio.post('/users/profile', data: {
        if (displayName != null) 'display_name': displayName,
        if (email != null) 'email': email,
      });

      // After updating remote, save locally
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
      ));
    } catch (e) {
      rethrow;
    }
  }
}

// Need a provider for AppDatabase and LocalRepository
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
  return UserRepository(dio, localRepo);
});
