import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'activity_log_provider.dart';
import '../domain/models/activity_log_model.dart';
import '../core/theme.dart';

class ActivityLogScreen extends ConsumerWidget {
  final bool isBusinessMode;

  const ActivityLogScreen({super.key, required this.isBusinessMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesState = ref.watch(
      isBusinessMode ? filteredBusinessActivityLogProvider : userActivityLogProvider
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity History'),
        bottom: isBusinessMode ? _buildFilterBar(context, ref) : null,
      ),
      body: activitiesState.when(
        data: (activities) {
          if (activities.isEmpty) {
            return _buildEmptyState(context);
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(
              isBusinessMode ? businessActivityLogProvider.notifier : userActivityLogProvider.notifier
            ).refresh(),
            child: _buildActivityList(context, activities),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => _buildErrorState(context, ref, e),
      ),
    );
  }

  PreferredSizeWidget _buildFilterBar(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(activityFilterProvider);
    final filters = [
      {'label': 'All', 'value': 'all'},
      {'label': 'Card Issued', 'value': 'card_issued'},
      {'label': 'Profile Updated', 'value': 'profile_updated'},
      {'label': 'QR Validated', 'value': 'qr_validation_success'},
    ];

    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: filters.map((filter) {
            final isSelected = currentFilter == filter['value'];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                label: Text(filter['label']!),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    ref.read(activityFilterProvider.notifier).state = filter['value']!;
                  } else if (isSelected) {
                    // Prevent unselecting if it's the only one, or default to 'all'
                    ref.read(activityFilterProvider.notifier).state = 'all';
                  }
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'No activity found',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 16),
          Text(
            'Failed to load activity',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => ref.read(
              isBusinessMode ? businessActivityLogProvider.notifier : userActivityLogProvider.notifier
            ).refresh(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityList(BuildContext context, List<ActivityLogModel> activities) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    List<Widget> listItems = [];
    String? currentGroup;

    for (var activity in activities) {
      final actDate = DateTime(activity.createdAt.year, activity.createdAt.month, activity.createdAt.day);
      String group;

      if (actDate == today) {
        group = 'Today';
      } else if (actDate == yesterday) {
        group = 'Yesterday';
      } else {
        group = DateFormat.yMMMMd().format(actDate);
      }

      if (group != currentGroup) {
        listItems.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              group,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ),
        );
        currentGroup = group;
      }

      listItems.add(_buildActivityItem(context, activity));
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: listItems,
    );
  }

  Widget _buildActivityItem(BuildContext context, ActivityLogModel activity) {
    final theme = Theme.of(context);

    String getActionLabel() {
      switch (activity.actionType) {
        case 'card_issued':
          return 'Card Issued';
        case 'profile_updated':
          return 'Profile Updated';
        case 'qr_validation_success':
          return 'QR Validated';
        default:
          return activity.actionType.replaceAll('_', ' ');
      }
    }

    IconData getIconForType() {
      switch (activity.actionType) {
        case 'card_issued':
          return Icons.add_card;
        case 'profile_updated':
          return Icons.manage_accounts;
        case 'qr_validation_success':
          return Icons.check_circle_outline;
        default:
          return Icons.history;
      }
    }

    return ListTile(
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        child: Icon(
          getIconForType(),
          size: 16,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      title: Text(
        getActionLabel(),
        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simplified source/entity string for MVP
          Text(
            'Ref: ${activity.operationId?.substring(0, 8) ?? activity.id.substring(0, 8)}',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
          ),
          Text(
            DateFormat.jm().format(activity.createdAt),
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.outline),
          ),
        ],
      ),
      isThreeLine: true,
      dense: true,
    );
  }
}
