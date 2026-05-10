import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }
enum UserRole { none, user, business }

class AuthState {
  final AuthStatus status;
  final UserRole role;
  final bool hasCompletedOnboarding;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.role = UserRole.none,
    this.hasCompletedOnboarding = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserRole? role,
    bool? hasCompletedOnboarding,
  }) {
    return AuthState(
      status: status ?? this.status,
      role: role ?? this.role,
      hasCompletedOnboarding: hasCompletedOnboarding ?? this.hasCompletedOnboarding,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Simulate initial loading state then move to unauthenticated
    Future.delayed(const Duration(seconds: 2), () {
      if (state.status == AuthStatus.unknown) {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    });
    return const AuthState();
  }

  void selectRole(UserRole role) {
    state = state.copyWith(role: role);
  }

  void login() {
    state = state.copyWith(status: AuthStatus.authenticated);
  }

  void completeOnboarding() {
    state = state.copyWith(hasCompletedOnboarding: true);
  }

  void logout() {
    state = const AuthState(status: AuthStatus.unauthenticated);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
