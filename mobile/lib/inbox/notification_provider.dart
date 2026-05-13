import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/notification_model.dart';
import '../domain/repositories/repositories.dart';
import '../domain/repositories/providers.dart';
import '../core/auth_provider.dart';

final notificationProvider = StateNotifierProvider<NotificationNotifier, AsyncValue<List<NotificationModel>>>((ref) {
  final localRepo = ref.watch(localRepositoryProvider);
  final authState = ref.watch(authStateProvider);
  // Assuming the user's ID is stored in uid, fallback to email if necessary based on auth setup
  final userId = authState.value?.uid;
  return NotificationNotifier(localRepo, userId);
});

final unreadNotificationCountProvider = Provider<int>((ref) {
  final notificationsState = ref.watch(notificationProvider);
  return notificationsState.maybeWhen(
    data: (notifications) => notifications.where((n) => !n.isRead).length,
    orElse: () => 0,
  );
});

class NotificationNotifier extends StateNotifier<AsyncValue<List<NotificationModel>>> {
  final LocalRepository _localRepo;
  final String? _userId;

  NotificationNotifier(this._localRepo, this._userId) : super(const AsyncValue.loading()) {
    state = const AsyncValue.loading();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    if (_userId == null) {
      state = const AsyncValue.data([]);
      return;
    }

    try {
      state = const AsyncValue.loading();
      final notifications = await _localRepo.getNotifications(_userId!);
      // Sort by descending created date
      notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = AsyncValue.data(notifications);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    // In a real app with sync, this might trigger a remote fetch before loading local
    await _loadNotifications();
  }

  Future<void> markAsRead(String notificationId) async {
    if (state.value == null) return;

    final notifications = state.value!;
    final index = notifications.indexWhere((n) => n.id == notificationId);
    if (index == -1) return;

    final notification = notifications[index];
    if (notification.isRead) return;

    // Optimistic update
    final updatedNotification = notification.copyWith(
      isRead: true,
      syncState: 'pending', // Queuing it for sync
      localUpdatedAt: DateTime.now()
    );

    final updatedList = List<NotificationModel>.from(notifications);
    updatedList[index] = updatedNotification;
    state = AsyncValue.data(updatedList);

    // Save to local DB
    try {
      await _localRepo.saveNotification(updatedNotification);
      // NOTE: In a full implementation, you would also enqueue a sync job here
    } catch (e) {
      // If DB update fails, you could revert the optimistic update
    }
  }
}
