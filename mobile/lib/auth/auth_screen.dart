import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/auth_provider.dart';
import '../core/widgets.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _phoneController = TextEditingController();
  bool _isLoading = false;
  bool _codeSent = false;
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _sendCode() {
    if (_phoneController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    // Mock sending code
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _codeSent = true;
        });
      }
    });
  }

  void _verifyCode() {
    if (_codeController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    // Mock verifying code
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        ref.read(authProvider.notifier).login();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(authProvider.notifier).selectRole(UserRole.none);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _codeSent ? 'Enter Code' : 'Enter Phone Number',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                _codeSent
                  ? 'We sent a verification code to ${_phoneController.text}'
                  : 'We will send you a verification code to login or sign up.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),

              if (!_codeSent) ...[
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Send Code',
                  onPressed: _sendCode,
                  isLoading: _isLoading,
                ),
              ] else ...[
                TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '6-digit code',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  maxLength: 6,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Verify & Login',
                  onPressed: _verifyCode,
                  isLoading: _isLoading,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
