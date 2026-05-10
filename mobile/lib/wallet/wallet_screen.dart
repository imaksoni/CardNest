import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';
import '../core/widgets.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const SafeArea(
        child: EmptyState(
          title: 'Your wallet is empty',
          message: 'Scan a QR code at a participating business to add your first loyalty card.',
          icon: Icons.account_balance_wallet_outlined,
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
