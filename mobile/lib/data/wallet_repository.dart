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

  Future<void> refreshWallet() async {
    // Used to inform the local wallet screen to pull the latest cards
    // In an actual offline-first setup, this would trigger a remote sync to local DB
    // Since MVP relies on the future provider, invalidating the provider does the work.
  }
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  return WalletRepository(dio);
});

// Real provider fetching from repository
final myCardsProvider = FutureProvider<List<dynamic>>((ref) async {
  return ref.watch(walletRepositoryProvider).getMyCards();
});
