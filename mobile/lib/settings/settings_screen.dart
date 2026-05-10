import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    final hasBothRoles = authState.availableRoles.contains('user') &&
        authState.availableRoles.contains('business');

    final oppositeRole = authState.role == UserRole.user ? UserRole.business : UserRole.user;
    final oppositeRoleName = oppositeRole == UserRole.business ? 'Business' : 'User';

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Account Settings'),
            subtitle: Text('Manage your profile and preferences'),
          ),
          if (hasBothRoles)
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: Text('Switch to $oppositeRoleName'),
              onTap: () {
                ref.read(authProvider.notifier).switchRole(oppositeRole);
              },
            ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              ref.read(authProvider.notifier).logout();
            },
          )
        ],
      ),
    );
  }
}
