import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'profile_model.dart';

extension ProfileModelMapper on ProfileModel {
  static ProfileModel fromDb(db.Profile dbProfile) {
    return ProfileModel(
      id: dbProfile.id,
      firebaseUid: dbProfile.firebaseUid,
      email: dbProfile.email,
      displayName: dbProfile.displayName,
      role: dbProfile.role,
      localUpdatedAt: dbProfile.localUpdatedAt,
      serverUpdatedAt: dbProfile.serverUpdatedAt,
      syncState: dbProfile.syncState,
      operationId: dbProfile.operationId,
      isDeleted: dbProfile.isDeleted,
    );
  }

  db.ProfilesCompanion toDb() {
    return db.ProfilesCompanion.insert(
      id: id,
      firebaseUid: Value(firebaseUid),
      email: Value(email),
      displayName: Value(displayName),
      role: Value(role),
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
