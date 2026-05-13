import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/business_repository.dart';

class MemberDetailScreen extends ConsumerWidget {
  final int memberId;

  const MemberDetailScreen({super.key, required this.memberId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Member Details')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ref.read(businessRepositoryProvider).getMemberDetail(memberId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}', textAlign: TextAlign.center),
                ]
              )
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Member not found.'));
          }

          final data = snapshot.data!;
          final user = data['user'];
          final cards = data['cards'] as List<dynamic>? ?? [];
          final activities = data['activities'] as List<dynamic>? ?? [];

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 32)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user['display_name'] ?? 'Unknown', style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 4),
                            Text(user['phone_number'], style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text('Linked Cards', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (cards.isEmpty)
                const Center(child: Padding(padding: EdgeInsets.all(16.0), child: Text('No cards linked.', style: TextStyle(color: Colors.grey)))),
              ...cards.map((c) => Card(
                child: ListTile(
                  leading: const Icon(Icons.credit_card, color: Colors.blue),
                  title: Text(c['program_name']),
                  subtitle: Text('Tier: ${c['tier_name'] ?? 'None'}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${c['points']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Text('pts', style: TextStyle(fontSize: 10)),
                    ]
                  ),
                ),
              )),
              const SizedBox(height: 24),

              Text('Recent Activities', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (activities.isEmpty)
                const Center(child: Padding(padding: EdgeInsets.all(16.0), child: Text('No recent activities.', style: TextStyle(color: Colors.grey)))),
              ...activities.map((a) => ListTile(
                leading: const Icon(Icons.history),
                title: Text(a['description'] ?? 'Activity'),
                subtitle: Text(a['created_at'].toString().split('T').first),
                trailing: Text('+${a['points_added']} pts', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              )),
            ],
          );
        },
      ),
    );
  }
}
