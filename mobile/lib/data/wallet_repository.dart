import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';

class WalletRepository {
  final Dio _dio;

  WalletRepository(this._dio);

  Future<List<dynamic>> getMyCards() async {
    try {
      final response = await _dio.get('/cards/my-cards');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  return WalletRepository(dio);
});

final myCardsProvider = FutureProvider<List<dynamic>>((ref) async {
  final repo = ref.watch(walletRepositoryProvider);
  return repo.getMyCards();
});
