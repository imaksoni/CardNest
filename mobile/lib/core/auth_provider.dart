import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

enum AuthStatus { unknown, unauthenticated, authenticated }
enum UserRole { none, user, business }

class AuthState {
  final AuthStatus status;
  final UserRole role;
  final bool hasCompletedOnboarding;
  final String? firebaseUid;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.role = UserRole.none,
    this.hasCompletedOnboarding = false,
    this.firebaseUid,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserRole? role,
    bool? hasCompletedOnboarding,
    String? firebaseUid,
  }) {
    return AuthState(
      status: status ?? this.status,
      role: role ?? this.role,
      hasCompletedOnboarding: hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      firebaseUid: firebaseUid ?? this.firebaseUid,
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
        // Simulate backend token exchange or profile setup
        await Future.delayed(const Duration(seconds: 1));

        state = state.copyWith(
          status: AuthStatus.authenticated,
          firebaseUid: user.uid,
        );
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

  // Still keeping a manual override or explicit call just in case, but usually handled by stream
  void login() {
    state = state.copyWith(status: AuthStatus.authenticated);
  }

  void completeOnboarding() {
    state = state.copyWith(hasCompletedOnboarding: true);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    state = state.copyWith(status: AuthStatus.unauthenticated, firebaseUid: null);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
