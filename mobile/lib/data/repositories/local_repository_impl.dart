import '../../domain/repositories/repositories.dart';
import '../../domain/models/profile_model.dart' as dm;
import '../../domain/models/profile_model_mapper.dart';
import '../../domain/models/business_model.dart' as dm;
import '../../domain/models/business_model_mapper.dart';
import '../../domain/models/program_model.dart' as dm;
import '../../domain/models/program_model_mapper.dart';
import '../../domain/models/tier_model.dart' as dm;
import '../../domain/models/tier_model_mapper.dart';
import '../../domain/models/card_domain_model.dart' as dm;
import '../../domain/models/card_domain_model_mapper.dart';
import '../../domain/models/card_activity_model.dart' as dm;
import '../../domain/models/card_activity_model_mapper.dart';
import '../../domain/models/qr_scan_history_model.dart' as dm;
import '../../domain/models/qr_scan_history_model_mapper.dart';
import '../local/database.dart';

class LocalRepositoryImpl implements LocalRepository {
  final AppDatabase _db;

  LocalRepositoryImpl(this._db);

  @override
  Future<dm.ProfileModel?> getProfile(String id) async {
    final query = _db.select(_db.profiles)..where((t) => t.id.equals(id));
    final dbProfile = await query.getSingleOrNull();
    return dbProfile != null ? ProfileModelMapper.fromDb(dbProfile) : null;
  }

  @override
  Future<void> saveProfile(dm.ProfileModel profile) async {
    await _db.into(_db.profiles).insertOnConflictUpdate(profile.toDb());
  }

  @override
  Future<List<dm.BusinessModel>> getAllBusinesses() async {
    final results = await _db.select(_db.businesses).get();
    return results.map((b) => BusinessModelMapper.fromDb(b)).toList();
  }

  @override
  Future<dm.BusinessModel?> getBusiness(String id) async {
    final query = _db.select(_db.businesses)..where((t) => t.id.equals(id));
    final dbBusiness = await query.getSingleOrNull();
    return dbBusiness != null ? BusinessModelMapper.fromDb(dbBusiness) : null;
  }

  @override
  Future<void> saveBusiness(dm.BusinessModel business) async {
    await _db.into(_db.businesses).insertOnConflictUpdate(business.toDb());
  }

  @override
  Future<dm.ProgramModel?> getProgram(String id) async {
    final query = _db.select(_db.programs)..where((t) => t.id.equals(id));
    final dbProgram = await query.getSingleOrNull();
    return dbProgram != null ? ProgramModelMapper.fromDb(dbProgram) : null;
  }

  @override
  Future<List<dm.ProgramModel>> getProgramsForBusiness(String businessId) async {
    final query = _db.select(_db.programs)..where((t) => t.businessId.equals(businessId));
    final results = await query.get();
    return results.map((p) => ProgramModelMapper.fromDb(p)).toList();
  }

  @override
  Future<void> saveProgram(dm.ProgramModel program) async {
    await _db.into(_db.programs).insertOnConflictUpdate(program.toDb());
  }

  @override
  Future<List<dm.TierModel>> getTiersForProgram(String programId) async {
    final query = _db.select(_db.tiers)..where((t) => t.programId.equals(programId));
    final results = await query.get();
    return results.map((t) => TierModelMapper.fromDb(t)).toList();
  }

  @override
  Future<void> saveTier(dm.TierModel tier) async {
    await _db.into(_db.tiers).insertOnConflictUpdate(tier.toDb());
  }

  @override
  Future<dm.CardDomainModel?> getCard(String id) async {
    final query = _db.select(_db.cards)..where((t) => t.id.equals(id));
    final dbCard = await query.getSingleOrNull();
    return dbCard != null ? CardDomainModelMapper.fromDb(dbCard) : null;
  }

  @override
  Future<List<dm.CardDomainModel>> getCardsForUser(String userId) async {
    final query = _db.select(_db.cards)..where((t) => t.userId.equals(userId));
    final results = await query.get();
    return results.map((c) => CardDomainModelMapper.fromDb(c)).toList();
  }

  @override
  Future<void> saveCard(dm.CardDomainModel card) async {
    await _db.into(_db.cards).insertOnConflictUpdate(card.toDb());
  }

  @override
  Future<List<dm.CardActivityModel>> getActivitiesForCard(String cardId) async {
    final query = _db.select(_db.cardActivities)..where((t) => t.cardId.equals(cardId));
    final results = await query.get();
    return results.map((a) => CardActivityModelMapper.fromDb(a)).toList();
  }

  @override
  Future<void> saveCardActivity(dm.CardActivityModel activity) async {
    await _db.into(_db.cardActivities).insertOnConflictUpdate(activity.toDb());
  }

  @override
  Future<List<dm.QrScanHistoryModel>> getScanHistoryForScanner(String scannerId) async {
    final query = _db.select(_db.qrScanHistories)..where((t) => t.scannerId.equals(scannerId));
    final results = await query.get();
    return results.map((h) => QrScanHistoryModelMapper.fromDb(h)).toList();
  }

  @override
  Future<void> saveQrScanHistory(dm.QrScanHistoryModel history) async {
    await _db.into(_db.qrScanHistories).insertOnConflictUpdate(history.toDb());
  }
}
