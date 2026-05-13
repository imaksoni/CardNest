import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';
import '../domain/models/business_model.dart';
import '../domain/repositories/repositories.dart';
import 'user_repository.dart';

class BusinessRepository {
  final Dio _dio;
  final LocalRepository _localRepo;

  BusinessRepository(this._dio, this._localRepo);

  Future<void> updateBusiness({
    required String name,
    String? description,
    String? category,
  }) async {
    try {
      final response = await _dio.post('/business/profile', data: {
        'name': name,
        if (description != null) 'description': description,
        if (category != null) 'category': category,
      });

      // After updating remote, save locally
      final businessId = 'current_business'; // Placeholder for now

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
      ));
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
  return BusinessRepository(dio, localRepo);
});
