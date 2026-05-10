import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';
import '../core/widgets.dart';

class BusinessDashboardScreen extends ConsumerWidget {
  const BusinessDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Dashboard'),
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
          title: 'Welcome to your Dashboard',
          message: 'Here you will see your active members, recent transactions, and program performance.',
          icon: Icons.dashboard_outlined,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for Quick Action (e.g. Scan member QR)
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
