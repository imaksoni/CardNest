import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'notification_provider.dart';
import '../domain/models/notification_model.dart';
import '../core/theme.dart';

class InboxScreen extends ConsumerWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsState = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notificationsState.when(
        data: (notifications) {
          if (notifications.isEmpty) {
            return _buildEmptyState(context);
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(notificationProvider.notifier).refresh(),
            child: _buildNotificationList(context, ref, notifications),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => _buildOfflineOrErrorState(context, ref, e),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "You're all caught up!",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineOrErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off, size: 64, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'Unable to load notifications',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => ref.read(notificationProvider.notifier).refresh(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context, WidgetRef ref, List<NotificationModel> notifications) {
    // Group notifications by date (Today, Yesterday, Earlier)
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    List<Widget> listItems = [];
    String? currentGroup;

    for (var notification in notifications) {
      final notifDate = DateTime(notification.createdAt.year, notification.createdAt.month, notification.createdAt.day);
      String group;

      if (notifDate == today) {
        group = 'Today';
      } else if (notifDate == yesterday) {
        group = 'Yesterday';
      } else {
        group = 'Earlier';
      }

      if (group != currentGroup) {
        listItems.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              group,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        );
        currentGroup = group;
      }

      listItems.add(_buildNotificationItem(context, ref, notification));
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: listItems,
    );
  }

  Widget _buildNotificationItem(BuildContext context, WidgetRef ref, NotificationModel notification) {
    final theme = Theme.of(context);
    final isUnread = !notification.isRead;

    IconData getIconForType(String type) {
      switch (type) {
        case 'card_issued':
          return Icons.credit_card;
        case 'profile_updated':
          return Icons.person;
        case 'qr_validated':
          return Icons.qr_code_scanner;
        default:
          return Icons.notifications;
      }
    }

    return InkWell(
      onTap: () {
        if (isUnread) {
          ref.read(notificationProvider.notifier).markAsRead(notification.id);
        }
      },
      child: Container(
        color: isUnread ? theme.colorScheme.primaryContainer.withOpacity(0.3) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unread dot indicator
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 8, right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isUnread ? theme.colorScheme.primary : Colors.transparent,
              ),
            ),

            // Icon
            CircleAvatar(
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              child: Icon(
                getIconForType(notification.type),
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.jm().format(notification.createdAt),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.body,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isUnread ? theme.colorScheme.onSurface : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
