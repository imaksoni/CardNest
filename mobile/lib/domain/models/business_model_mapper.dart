import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'business_model.dart';

extension BusinessModelMapper on BusinessModel {
  static BusinessModel fromDb(db.BusinessesData dbBusiness) {
    return BusinessModel(
      id: dbBusiness.id,
      name: dbBusiness.name,
      ownerId: dbBusiness.ownerId,
      description: dbBusiness.description,
      logoUrl: dbBusiness.logoUrl,
      localUpdatedAt: dbBusiness.localUpdatedAt,
      serverUpdatedAt: dbBusiness.serverUpdatedAt,
      syncState: dbBusiness.syncState,
      operationId: dbBusiness.operationId,
      isDeleted: dbBusiness.isDeleted,
    );
  }

  db.BusinessesCompanion toDb() {
    return db.BusinessesCompanion.insert(
      id: id,
      name: name,
      ownerId: Value(ownerId),
      description: Value(description),
      logoUrl: Value(logoUrl),
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
