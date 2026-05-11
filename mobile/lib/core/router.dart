import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

// Import placeholder screens
import '../splash/splash_screen.dart';
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
import '../wallet/card_detail_screen.dart';
import '../wallet/activity_history_screen.dart';
import '../business_profile/business_profile_screen.dart';
import '../business_dashboard/business_scaffold.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
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
        path: '/card_detail',
        builder: (context, state) {
          final cardData = state.extra as Map<String, dynamic>;
          return CardDetailScreen(cardData: cardData);
        },
      ),
      GoRoute(
        path: '/card_activity',
        builder: (context, state) {
          final cardId = state.extra as String;
          return ActivityHistoryScreen(cardId: cardId);
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BusinessScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const BusinessDashboardScreen(),
          ),
          GoRoute(
            path: '/business_profile',
            builder: (context, state) => const BusinessProfileScreen(),
          ),
          GoRoute(
            path: '/programs',
            builder: (context, state) => const ProgramsScreen(),
          ),
          GoRoute(
            path: '/members',
            builder: (context, state) => const MembersScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/tiers',
        builder: (context, state) => const TiersScreen(),
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
      final isSplash = state.uri.path == '/splash';
      final isRoleSelection = state.uri.path == '/role_selection';
      final isAuth = state.uri.path == '/auth';

      if (authState.status == AuthStatus.unknown) {
        return isSplash ? null : '/splash';
      }

      if (authState.status == AuthStatus.unauthenticated) {
        if (authState.role == UserRole.none) {
          return isRoleSelection ? null : '/role_selection';
        }
        return isAuth ? null : '/auth';
      }

      if (authState.status == AuthStatus.authenticated) {
        if (isSplash || isRoleSelection || isAuth) {
           return authState.hasCompletedOnboarding
              ? (authState.role == UserRole.business ? '/dashboard' : '/wallet')
              : '/onboarding';
        }

        if (!authState.hasCompletedOnboarding) {
          return state.uri.path == '/onboarding' ? null : '/onboarding';
        }

        // They are authenticated and completed onboarding
        if (state.uri.path == '/onboarding') {
          return authState.role == UserRole.business ? '/dashboard' : '/wallet';
        }
      }

      return null;
    },
  );
});
