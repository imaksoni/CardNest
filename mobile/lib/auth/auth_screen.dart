import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  String _verificationId = '';
  String? _errorMessage;
  int? _resendToken;

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _sendCode() async {
    final phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: _resendToken,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-resolution on Android devices
          await FirebaseAuth.instance.signInWithCredential(credential);
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            // State is updated automatically via authStateChanges in authProvider
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (mounted) {
            setState(() {
              _isLoading = false;
              _errorMessage = e.message ?? 'Verification failed';
            });
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          if (mounted) {
            setState(() {
              _isLoading = false;
              _codeSent = true;
              _verificationId = verificationId;
              _resendToken = resendToken;
            });
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (mounted) {
            _verificationId = verificationId;
          }
        },
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _verifyCode() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // State is updated automatically via authStateChanges in authProvider
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.message ?? 'Invalid code';
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
        ref.read(authProvider.notifier).clearError();
      }
    });

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

              if (_errorMessage != null) ...[
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                const SizedBox(height: 16),
              ],

              if (!_codeSent) ...[
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number (e.g. +1234567890)',
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
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _isLoading ? null : _sendCode,
                  child: const Text('Resend Code'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
