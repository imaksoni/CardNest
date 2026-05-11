import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';
import '../core/widgets.dart';
import '../data/user_repository.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final role = ref.read(authProvider).role;
      if (role == UserRole.user) {
        await ref.read(userRepositoryProvider).updateProfile(
              displayName: _displayNameController.text.trim(),
              email: _emailController.text.trim(),
            );
      }
      // Business onboarding not fully implemented yet, just complete it
      ref.read(authProvider.notifier).completeOnboarding();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to complete onboarding: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: isBusiness
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const EmptyState(
                      title: 'Set up your business',
                      message:
                          'Add your business details, location, and customize your loyalty program to start rewarding customers.',
                      icon: Icons.storefront,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      text: 'Complete Onboarding',
                      onPressed: () {
                        ref.read(authProvider.notifier).completeOnboarding();
                      },
                    ),
                  ],
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Complete your profile',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Add your name and email to personalize your experience and start collecting rewards.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _displayNameController,
                        decoration: const InputDecoration(
                          labelText: 'Display Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a display name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value != null &&
                              value.trim().isNotEmpty &&
                              !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const Spacer(),
                      if (_isLoading)
                        const Center(child: CircularProgressIndicator())
                      else
                        PrimaryButton(
                          text: 'Complete Onboarding',
                          onPressed: _submit,
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
