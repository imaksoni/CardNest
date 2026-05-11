import 'package:drift/drift.dart';

// Mixin for standard sync status fields
mixin SyncStatusMixin on Table {
  DateTimeColumn get localUpdatedAt => dateTime().nullable()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();
  TextColumn get syncState => text().nullable()(); // 'synced', 'pending', 'error'
  TextColumn get operationId => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class Profiles extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get firebaseUid => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get displayName => text().nullable()();
  TextColumn get role => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Businesses extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get ownerId => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get logoUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Programs extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Tiers extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get programId => text()();
  TextColumn get name => text()();
  IntColumn get pointsRequired => integer()();
  TextColumn get benefits => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Cards extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get programId => text()();
  IntColumn get points => integer().withDefault(const Constant(0))();
  TextColumn get currentTierId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CardActivities extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get cardId => text()();
  IntColumn get pointsAdded => integer()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get timestamp => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class QrScanHistories extends Table with SyncStatusMixin {
  TextColumn get id => text()();
  TextColumn get scannerId => text()();
  TextColumn get qrData => text()();
  DateTimeColumn get scanTime => dateTime()();
  TextColumn get status => text()(); // 'success', 'failed'

  @override
  Set<Column> get primaryKey => {id};
}

class SyncQueues extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get operationType => text()(); // 'insert', 'update', 'delete'
  TextColumn get modelName => text()();
  TextColumn get entityId => text()();
  TextColumn get payload => text()(); // JSON string
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
}

class SyncMetadatas extends Table {
  TextColumn get modelName => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {modelName};
}
