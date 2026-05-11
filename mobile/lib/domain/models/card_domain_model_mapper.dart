import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'card_domain_model.dart';

extension CardDomainModelMapper on CardDomainModel {
  static CardDomainModel fromDb(db.Card dbCard) {
    return CardDomainModel(
      id: dbCard.id,
      userId: dbCard.userId,
      programId: dbCard.programId,
      points: dbCard.points,
      currentTierId: dbCard.currentTierId,
      localUpdatedAt: dbCard.localUpdatedAt,
      serverUpdatedAt: dbCard.serverUpdatedAt,
      syncState: dbCard.syncState,
      operationId: dbCard.operationId,
      isDeleted: dbCard.isDeleted,
    );
  }

  db.CardsCompanion toDb() {
    return db.CardsCompanion.insert(
      id: id,
      userId: userId,
      programId: programId,
      points: Value(points),
      currentTierId: Value(currentTierId),
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
