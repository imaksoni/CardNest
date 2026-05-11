import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';
import '../business_dashboard/dashboard_provider.dart';
import '../core/widgets.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardDataAsync = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Profile'),
      ),
      body: SafeArea(
        child: dashboardDataAsync.when(
          loading: () => const LoadingState(message: 'Loading profile...'),
          error: (err, stack) => ErrorState(
            message: 'Failed to load profile: $err',
            onRetry: () => ref.invalidate(dashboardProvider),
          ),
          data: (data) {
            final business = data.business;
            if (business == null) {
              return const EmptyState(title: 'No business found');
            }

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: business.logoUrl != null
                          ? NetworkImage(business.logoUrl!)
                          : null,
                      child: business.logoUrl == null
                          ? const Icon(Icons.store, size: 50)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    business.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  if (business.description != null)
                    Text(
                      business.description!,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 32),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      // Navigate to settings
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Support'),
                    onTap: () {
                      // Navigate to help
                    },
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () {
                      ref.read(authProvider.notifier).logout();
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Log Out'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      side: BorderSide(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
