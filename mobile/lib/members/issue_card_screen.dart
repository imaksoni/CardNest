import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../data/card_repository.dart';

class IssueCardScreen extends ConsumerStatefulWidget {
  final int userId;

  const IssueCardScreen({super.key, required this.userId});

  @override
  ConsumerState<IssueCardScreen> createState() => _IssueCardScreenState();
}

class _IssueCardScreenState extends ConsumerState<IssueCardScreen> {
  int? _selectedProgramId;
  int? _selectedTierId;
  bool _isIssuing = false;

  Future<void> _issueCard() async {
    if (_selectedProgramId == null || _selectedTierId == null || _isIssuing) return;

    setState(() {
      _isIssuing = true;
    });

    try {
      final operationId = const Uuid().v4();
      await ref.read(cardRepositoryProvider).issueCard(
        userId: widget.userId,
        programId: _selectedProgramId!,
        tierId: _selectedTierId,
        operationId: operationId,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Card issued successfully')));
        context.pop(); // Pop Issue Card
        context.pop(); // Pop Search Screen -> back to Members
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to issue card: $e'), backgroundColor: Colors.red));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isIssuing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Issue Card')),
      body: FutureBuilder<List<dynamic>>(
        // Placeholder for fetching real programs & tiers of the business
        future: Future.value([
          {'id': 1, 'name': 'Coffee Rewards', 'tiers': [{'id': 10, 'name': 'Bronze'}, {'id': 11, 'name': 'Silver'}]}
        ]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final programs = snapshot.data!;
          final selectedProgram = programs.firstWhere(
            (p) => p['id'] == _selectedProgramId,
            orElse: () => null
          );
          final tiers = selectedProgram != null ? (selectedProgram['tiers'] as List) : [];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Select Program'),
                  value: _selectedProgramId,
                  items: programs.map((p) => DropdownMenuItem<int>(
                    value: p['id'],
                    child: Text(p['name']),
                  )).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedProgramId = val;
                      _selectedTierId = null; // Reset tier on program change
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Select Tier'),
                  value: _selectedTierId,
                  items: tiers.map((t) => DropdownMenuItem<int>(
                    value: t['id'],
                    child: Text(t['name']),
                  )).toList(),
                  onChanged: _selectedProgramId == null ? null : (val) {
                    setState(() {
                      _selectedTierId = val;
                    });
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: (_selectedProgramId != null && _selectedTierId != null && !_isIssuing) ? _issueCard : null,
                  child: _isIssuing ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Issue Card'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
