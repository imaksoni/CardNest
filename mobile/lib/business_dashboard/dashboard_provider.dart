import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/business_repository.dart';
import '../domain/models/business_model.dart';
import '../data/user_repository.dart';

class DashboardData {
  final BusinessModel? business;
  final int totalMembers;
  final int activePrograms;
  final List<String> recentActivityLogs;

  DashboardData({
    required this.business,
    required this.totalMembers,
    required this.activePrograms,
    required this.recentActivityLogs,
  });
}

final dashboardProvider = FutureProvider<DashboardData>((ref) async {
  final businessRepo = ref.watch(businessRepositoryProvider);
  final localRepo = ref.watch(localRepositoryProvider);

  final business = await businessRepo.getCurrentBusiness();

  // Placeholders for real data when domain entities are fully hooked up
  int activePrograms = 0;
  if (business != null) {
    final programs = await localRepo.getProgramsForBusiness(business.id);
    activePrograms = programs.length;
  }

  // Mocks for now
  int totalMembers = 154;
  List<String> recentActivityLogs = [
    'John Doe joined Bronze Tier',
    'Jane Smith redeemed Free Coffee',
    'Scan successful: User 123',
  ];

  return DashboardData(
    business: business,
    totalMembers: totalMembers,
    activePrograms: activePrograms,
    recentActivityLogs: recentActivityLogs,
  );
});
