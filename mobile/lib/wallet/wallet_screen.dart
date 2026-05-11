import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/auth_provider.dart';
import '../core/widgets.dart';
import '../data/wallet_repository.dart';
import 'loyalty_card_widget.dart';
import 'offline_banner.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString));
    } catch (e) {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsAsync = ref.watch(myCardsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(myCardsProvider.future),
          child: Column(
            children: [
              // In a real app we would check a connectivity provider
              OfflineBanner(isOffline: cardsAsync.hasError),
              Expanded(
                child: cardsAsync.when(
            data: (cards) {
              if (cards.isEmpty) {
                return const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: EmptyState(
                        title: 'Your wallet is empty',
                        message: 'Scan a QR code at a participating business to add your first loyalty card.',
                        icon: Icons.account_balance_wallet_outlined,
                      ),
                    ),
                  ],
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return LoyaltyCardWidget(
                    cardNumber: card['card_number'] ?? '',
                    userName: card['user_name'] ?? '',
                    businessName: card['business_name'] ?? '',
                    tierName: card['tier_name'] ?? '',
                    points: card['points'] ?? 0,
                    expiry: card['expiry'],
                    cvv: card['cvv'] ?? '',
                    visualColor: _parseColor(card['visual_color'] ?? '0xFF607D8B'),
                    onTap: () {
                      context.push('/card_detail', extra: card);
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cloud_off, size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text('Offline or Failed to load cards', style: TextStyle(color: Colors.grey)),
                        TextButton(
                          onPressed: () => ref.refresh(myCardsProvider.future),
                          child: const Text('Retry'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for QR scan
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
