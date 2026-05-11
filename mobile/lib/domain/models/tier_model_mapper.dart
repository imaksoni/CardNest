import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'tier_model.dart';

extension TierModelMapper on TierModel {
  static TierModel fromDb(db.Tier dbTier) {
    return TierModel(
      id: dbTier.id,
      programId: dbTier.programId,
      name: dbTier.name,
      pointsRequired: dbTier.pointsRequired,
      benefits: dbTier.benefits,
      localUpdatedAt: dbTier.localUpdatedAt,
      serverUpdatedAt: dbTier.serverUpdatedAt,
      syncState: dbTier.syncState,
      operationId: dbTier.operationId,
      isDeleted: dbTier.isDeleted,
    );
  }

  db.TiersCompanion toDb() {
    return db.TiersCompanion.insert(
      id: id,
      programId: programId,
      name: name,
      pointsRequired: pointsRequired,
      benefits: Value(benefits),
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
