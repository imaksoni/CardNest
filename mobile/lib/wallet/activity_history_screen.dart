import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/widgets.dart';

// Mock Provider for Activity History
final cardActivityProvider = FutureProvider.family<List<Map<String, dynamic>>, String>((ref, cardId) async {
  // Simulate network delay
  await Future.delayed(const Duration(milliseconds: 800));

  return [
    {
      'date': '2023-10-25 14:30',
      'type': 'Earn',
      'points': 50,
      'description': 'Purchase at Coffee Beans',
    },
    {
      'date': '2023-10-20 09:15',
      'type': 'Redeem',
      'points': -100,
      'description': 'Free Coffee Reward',
    },
    {
      'date': '2023-10-15 16:45',
      'type': 'Earn',
      'points': 25,
      'description': 'Purchase at Coffee Beans',
    },
  ];
});

class ActivityHistoryScreen extends ConsumerWidget {
  final String cardId;

  const ActivityHistoryScreen({super.key, required this.cardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityAsync = ref.watch(cardActivityProvider(cardId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity History'),
      ),
      body: activityAsync.when(
        data: (activities) {
          if (activities.isEmpty) {
            return const EmptyState(
              title: 'No activity yet',
              message: 'Your transactions and point updates will appear here.',
              icon: Icons.history,
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: activities.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final activity = activities[index];
              final isEarn = activity['type'] == 'Earn';

              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: isEarn ? Colors.green.shade100 : Colors.red.shade100,
                  child: Icon(
                    isEarn ? Icons.add : Icons.remove,
                    color: isEarn ? Colors.green : Colors.red,
                  ),
                ),
                title: Text(
                  activity['description'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(activity['date'] ?? ''),
                trailing: Text(
                  '${isEarn ? '+' : ''}${activity['points']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isEarn ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 48, color: Colors.grey),
              const SizedBox(height: 16),
              const Text('Offline or Failed to load activity', style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () => ref.refresh(cardActivityProvider(cardId)),
                child: const Text('Retry'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
