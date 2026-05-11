import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'card_activity_model.dart';

extension CardActivityModelMapper on CardActivityModel {
  static CardActivityModel fromDb(db.CardActivity dbCardActivity) {
    return CardActivityModel(
      id: dbCardActivity.id,
      cardId: dbCardActivity.cardId,
      pointsAdded: dbCardActivity.pointsAdded,
      description: dbCardActivity.description,
      timestamp: dbCardActivity.timestamp,
      localUpdatedAt: dbCardActivity.localUpdatedAt,
      serverUpdatedAt: dbCardActivity.serverUpdatedAt,
      syncState: dbCardActivity.syncState,
      operationId: dbCardActivity.operationId,
      isDeleted: dbCardActivity.isDeleted,
    );
  }

  db.CardActivitiesCompanion toDb() {
    return db.CardActivitiesCompanion.insert(
      id: id,
      cardId: cardId,
      pointsAdded: pointsAdded,
      description: Value(description),
      timestamp: timestamp,
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
