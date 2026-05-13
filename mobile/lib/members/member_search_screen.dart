import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/user_repository.dart';

class MemberSearchScreen extends ConsumerStatefulWidget {
  const MemberSearchScreen({super.key});

  @override
  ConsumerState<MemberSearchScreen> createState() => _MemberSearchScreenState();
}

class _MemberSearchScreenState extends ConsumerState<MemberSearchScreen> {
  final _phoneController = TextEditingController();
  Map<String, dynamic>? _foundUser;
  bool _isLoading = false;
  String? _error;

  Future<void> _search() async {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _foundUser = null;
    });

    try {
      final user = await ref.read(userRepositoryProvider).searchUserByPhone(phone);
      if (user != null) {
        setState(() {
          _foundUser = user;
        });
      } else {
        setState(() {
          _error = 'User not found';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error searching user: $e';
      });
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
    return Scaffold(
      appBar: AppBar(title: const Text('Search Member')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                hintText: '+1234567890'
              ),
              keyboardType: TextInputType.phone,
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _search,
              child: _isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Search'),
            ),
            const SizedBox(height: 32),
            if (_error != null)
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.red.shade100,
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_error!, style: const TextStyle(color: Colors.red))),
                  ],
                ),
              ),
            if (_foundUser != null) ...[
              const Align(alignment: Alignment.centerLeft, child: Text('User Found:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(_foundUser!['display_name'] ?? _foundUser!['phone_number']),
                  subtitle: Text(_foundUser!['phone_number']),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white),
                  onPressed: () {
                    context.push('/issue_card', extra: _foundUser!['id']);
                  },
                  child: const Text('Issue Card to User'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
