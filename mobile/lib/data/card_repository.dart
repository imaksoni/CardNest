import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';

class CardRepository {
  final Dio _dio;

  CardRepository(this._dio);

  Future<void> issueCard({
    required int userId,
    required int programId,
    int? tierId,
    required String operationId,
  }) async {
    try {
      await _dio.post('/cards/issue', data: {
        'user_id': userId,
        'program_id': programId,
        if (tierId != null) 'tier_id': tierId,
        'operation_id': operationId,
      });
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 409) {
          throw Exception('User already has an active card for this program');
      }
      rethrow;
    }
  }
}

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  return CardRepository(dio);
});
