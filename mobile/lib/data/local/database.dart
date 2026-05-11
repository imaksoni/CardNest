import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:uuid/uuid.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Profiles,
  Businesses,
  Programs,
  Tiers,
  Cards,
  CardActivities,
  QrScanHistories,
  SyncQueues,
  SyncMetadatas,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> seedData() async {
    final uuid = const Uuid();

    await transaction(() async {
      // Seed Profile
      final profileId = uuid.v4();
      await into(profiles).insert(ProfilesCompanion.insert(
        id: profileId,
        displayName: const Value('Test User'),
        role: const Value('user'),
        email: const Value('test@example.com'),
      ));

      // Seed Business
      final businessId = uuid.v4();
      await into(businesses).insert(BusinessesCompanion.insert(
        id: businessId,
        name: 'My Awesome Cafe',
        description: const Value('Best coffee in town!'),
      ));

      // Seed Program
      final programId = uuid.v4();
      await into(programs).insert(ProgramsCompanion.insert(
        id: programId,
        businessId: businessId,
        name: 'Cafe Rewards',
        description: const Value('Earn points for every coffee'),
      ));

      // Seed Tiers
      final tier1Id = uuid.v4();
      await into(tiers).insert(TiersCompanion.insert(
        id: tier1Id,
        programId: programId,
        name: 'Bronze',
        pointsRequired: 0,
        benefits: const Value('Free wifi'),
      ));

      final tier2Id = uuid.v4();
      await into(tiers).insert(TiersCompanion.insert(
        id: tier2Id,
        programId: programId,
        name: 'Silver',
        pointsRequired: 100,
        benefits: const Value('Free wifi, 10% off pastry'),
      ));

      // Seed Card
      final cardId = uuid.v4();
      await into(cards).insert(CardsCompanion.insert(
        id: cardId,
        userId: profileId,
        programId: programId,
        points: const Value(50),
        currentTierId: Value(tier1Id),
      ));

      // Seed Card Activity
      await into(cardActivities).insert(CardActivitiesCompanion.insert(
        id: uuid.v4(),
        cardId: cardId,
        pointsAdded: 50,
        description: const Value('Bought 5 coffees'),
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ));
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
