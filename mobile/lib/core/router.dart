import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// Import placeholder screens
import '../auth/auth_screen.dart';
import '../role_selection/role_selection_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../wallet/wallet_screen.dart';
import '../business_dashboard/dashboard_screen.dart';
import '../programs/programs_screen.dart';
import '../tiers/tiers_screen.dart';
import '../members/members_screen.dart';
import '../qr_scan/qr_scan_screen.dart';
import '../sync/sync_screen.dart';
import '../settings/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/role_selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/wallet',
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const BusinessDashboardScreen(),
    ),
    GoRoute(
      path: '/programs',
      builder: (context, state) => const ProgramsScreen(),
    ),
    GoRoute(
      path: '/tiers',
      builder: (context, state) => const TiersScreen(),
    ),
    GoRoute(
      path: '/members',
      builder: (context, state) => const MembersScreen(),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const QrScanScreen(),
    ),
    GoRoute(
      path: '/sync',
      builder: (context, state) => const SyncScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    // TODO: Implement actual auth/role logic
    final bool isAuthenticated = false; // Placeholder

    if (!isAuthenticated && state.uri.path != '/auth') {
      // return '/auth';
      return null; // Let it pass for initial UI skeleton checking
    }
    return null;
  },
);
