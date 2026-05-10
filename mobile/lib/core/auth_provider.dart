import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../data/auth_repository.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }
enum UserRole { none, user, business }

class AuthState {
  final AuthStatus status;
  final UserRole role;
  final bool hasCompletedOnboarding;
  final String? firebaseUid;
  final List<String> availableRoles;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.role = UserRole.none,
    this.hasCompletedOnboarding = false,
    this.firebaseUid,
    this.availableRoles = const [],
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserRole? role,
    bool? hasCompletedOnboarding,
    String? firebaseUid,
    List<String>? availableRoles,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      role: role ?? this.role,
      hasCompletedOnboarding: hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      availableRoles: availableRoles ?? this.availableRoles,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  StreamSubscription<User?>? _authSubscription;

  @override
  AuthState build() {
    // Listen to Firebase Auth state changes
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null) {
        try {
          final repo = ref.read(authRepositoryProvider);
          final idToken = await user.getIdToken();

          if (idToken == null) throw Exception("Failed to get Firebase ID token");

          String roleString = state.role == UserRole.business ? 'business' : 'user';

          // Exchange token
          await repo.exchangeFirebaseToken(idToken, roleString);

          // Get profile
          final profile = await repo.getMe();

          bool completedOnboarding = profile.roles.contains(roleString);

          state = state.copyWith(
            status: AuthStatus.authenticated,
            firebaseUid: user.uid,
            availableRoles: profile.roles,
            hasCompletedOnboarding: completedOnboarding,
          );
        } catch (e) {
          await FirebaseAuth.instance.signOut();
          state = state.copyWith(
            status: AuthStatus.unauthenticated,
            firebaseUid: null,
            errorMessage: "Authentication failed. Please try again.",
          );
        }
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          firebaseUid: null,
        );
      }
    });

    // Cleanup subscription on dispose
    ref.onDispose(() {
      _authSubscription?.cancel();
    });

    return const AuthState();
  }

  void selectRole(UserRole role) {
    state = state.copyWith(role: role);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  Future<void> switchRole(UserRole newRole) async {
    state = state.copyWith(role: newRole, status: AuthStatus.unknown);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final repo = ref.read(authRepositoryProvider);
        final idToken = await user.getIdToken();
        if (idToken == null) throw Exception("Failed to get Firebase ID token");

        String roleString = newRole == UserRole.business ? 'business' : 'user';

        await repo.exchangeFirebaseToken(idToken, roleString);
        final profile = await repo.getMe();

        bool completedOnboarding = profile.roles.contains(roleString);

        state = state.copyWith(
          status: AuthStatus.authenticated,
          availableRoles: profile.roles,
          hasCompletedOnboarding: completedOnboarding,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      await FirebaseAuth.instance.signOut();
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: "Failed to switch role.",
      );
    }
  }

  void login() {
    state = state.copyWith(status: AuthStatus.authenticated);
  }

  void completeOnboarding() {
    state = state.copyWith(hasCompletedOnboarding: true);
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    await FirebaseAuth.instance.signOut();
    state = state.copyWith(status: AuthStatus.unauthenticated, firebaseUid: null, availableRoles: []);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
