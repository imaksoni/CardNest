import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';
import '../core/widgets.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(authProvider).role;
    final isBusiness = role == UserRole.business;

    return Scaffold(
      appBar: AppBar(
        title: Text(isBusiness ? 'Business Setup' : 'Profile Setup'),
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmptyState(
                title: isBusiness ? 'Set up your business' : 'Complete your profile',
                message: isBusiness
                  ? 'Add your business details, location, and customize your loyalty program to start rewarding customers.'
                  : 'Add your name and photo to personalize your experience and start collecting rewards.',
                icon: isBusiness ? Icons.storefront : Icons.person_outline,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Complete Onboarding',
                onPressed: () {
                  ref.read(authProvider.notifier).completeOnboarding();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
