import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/activity_log_model.dart';
import '../domain/repositories/repositories.dart';
import '../domain/repositories/providers.dart';
import '../core/auth_provider.dart';

final activityFilterProvider = StateProvider<String>((ref) => 'all');

final userActivityLogProvider = StateNotifierProvider<ActivityLogNotifier, AsyncValue<List<ActivityLogModel>>>((ref) {
  final localRepo = ref.watch(localRepositoryProvider);
  final userId = ref.watch(authStateProvider).value?.uid;
  return ActivityLogNotifier(localRepo, userId, isBusiness: false);
});

final businessActivityLogProvider = StateNotifierProvider<ActivityLogNotifier, AsyncValue<List<ActivityLogModel>>>((ref) {
  final localRepo = ref.watch(localRepositoryProvider);
  final userId = ref.watch(authStateProvider).value?.uid;
  return ActivityLogNotifier(localRepo, userId, isBusiness: true);
});

final filteredBusinessActivityLogProvider = Provider<AsyncValue<List<ActivityLogModel>>>((ref) {
  final state = ref.watch(businessActivityLogProvider);
  final filter = ref.watch(activityFilterProvider);

  return state.whenData((activities) {
    if (filter == 'all') return activities;
    return activities.where((a) => a.actionType == filter).toList();
  });
});

class ActivityLogNotifier extends StateNotifier<AsyncValue<List<ActivityLogModel>>> {
  final LocalRepository _localRepo;
  final String? _id; // User ID or Business ID (currently passing user ID and fetching business, assuming 1:1 for MVP)
  final bool _isBusiness;

  ActivityLogNotifier(this._localRepo, this._id, {required bool isBusiness})
    : _isBusiness = isBusiness,
      super(const AsyncValue.loading()) {
    state = const AsyncValue.loading();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    if (_id == null) {
      state = const AsyncValue.data([]);
      return;
    }

    try {
      state = const AsyncValue.loading();
      List<ActivityLogModel> activities = [];

      if (_isBusiness) {
        // Find business for this user
        final businesses = await _localRepo.getAllBusinesses();
        final business = businesses.where((b) => b.ownerId == _id).firstOrNull;
        if (business != null) {
            activities = await _localRepo.getActivityLogsForBusiness(business.id);
        }
      } else {
        activities = await _localRepo.getActivityLogsForUser(_id!);
      }

      activities.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = AsyncValue.data(activities);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await _loadActivities();
  }
}
