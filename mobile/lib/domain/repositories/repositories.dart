import '../models/profile_model.dart';
import '../models/business_model.dart';
import '../models/program_model.dart';
import '../models/tier_model.dart';
import '../models/card_domain_model.dart';
import '../models/card_activity_model.dart';
import '../models/qr_scan_history_model.dart';

abstract class LocalRepository {
  // Profiles
  Future<ProfileModel?> getProfile(String id);
  Future<void> saveProfile(ProfileModel profile);

  // Businesses
  Future<BusinessModel?> getBusiness(String id);
  Future<List<BusinessModel>> getAllBusinesses();
  Future<void> saveBusiness(BusinessModel business);

  // Programs
  Future<ProgramModel?> getProgram(String id);
  Future<List<ProgramModel>> getProgramsForBusiness(String businessId);
  Future<void> saveProgram(ProgramModel program);

  // Tiers
  Future<List<TierModel>> getTiersForProgram(String programId);
  Future<void> saveTier(TierModel tier);

  // Cards
  Future<CardDomainModel?> getCard(String id);
  Future<List<CardDomainModel>> getCardsForUser(String userId);
  Future<void> saveCard(CardDomainModel card);

  // Card Activities
  Future<List<CardActivityModel>> getActivitiesForCard(String cardId);
  Future<void> saveCardActivity(CardActivityModel activity);

  // QR Scan Histories
  Future<List<QrScanHistoryModel>> getScanHistoryForScanner(String scannerId);
  Future<void> saveQrScanHistory(QrScanHistoryModel history);
}

abstract class RemoteRepository {
  // Remote sync and API fetching placeholders
  Future<ProfileModel?> fetchProfile(String id);
  Future<void> pushProfile(ProfileModel profile);

  // Implement other remote abstractions as needed during sync engine build
}
