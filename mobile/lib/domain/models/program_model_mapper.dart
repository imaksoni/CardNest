import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'program_model.dart';

extension ProgramModelMapper on ProgramModel {
  static ProgramModel fromDb(db.Program dbProgram) {
    return ProgramModel(
      id: dbProgram.id,
      businessId: dbProgram.businessId,
      name: dbProgram.name,
      description: dbProgram.description,
      localUpdatedAt: dbProgram.localUpdatedAt,
      serverUpdatedAt: dbProgram.serverUpdatedAt,
      syncState: dbProgram.syncState,
      operationId: dbProgram.operationId,
      isDeleted: dbProgram.isDeleted,
    );
  }

  db.ProgramsCompanion toDb() {
    return db.ProgramsCompanion.insert(
      id: id,
      businessId: businessId,
      name: name,
      description: Value(description),
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
