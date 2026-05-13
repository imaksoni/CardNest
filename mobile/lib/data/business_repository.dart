import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';
import '../domain/models/business_model.dart';
import '../domain/repositories/repositories.dart';
import 'user_repository.dart';
import '../sync/sync_engine.dart';

class BusinessRepository {
  final Dio _dio;
  final LocalRepository _localRepo;
  final SyncEngine _syncEngine;

  BusinessRepository(this._dio, this._localRepo, this._syncEngine);

  Future<void> updateBusiness({
    required String name,
    String? description,
    String? category,
  }) async {
    try {
      final businessId = 'current_business'; // Placeholder for now

      // 1. Optimistic local save
      final business = await _localRepo.getBusiness(businessId) ??
          BusinessModel(
            id: businessId,
            name: name,
            description: description,
          );

      await _localRepo.saveBusiness(business.copyWith(
        name: name,
        description: description,
        localUpdatedAt: DateTime.now(),
        syncState: 'pending',
      ));

      // 2. Enqueue offline action
      await _syncEngine.enqueueOperation(
        'update',
        'business',
        businessId,
        {
          'name': name,
          if (description != null) 'description': description,
          if (category != null) 'category': category,
        }
      );

      _syncEngine.sync();
    } catch (e) {
      rethrow;
    }
  }

  Future<BusinessModel?> getCurrentBusiness() async {
    return _localRepo.getBusiness('current_business');
  }

  Future<List<dynamic>> getMembers() async {
    try {
      final response = await _dio.get('/businesses/members');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getMemberDetail(int memberId) async {
    try {
      final response = await _dio.get('/businesses/members/$memberId');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

final businessRepositoryProvider = Provider<BusinessRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  final localRepo = ref.watch(localRepositoryProvider);
  final syncEngine = ref.watch(syncEngineProvider.notifier);
  return BusinessRepository(dio, localRepo, syncEngine);
});
