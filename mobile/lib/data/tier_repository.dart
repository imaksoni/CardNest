import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import '../domain/models/tier_model.dart';
import '../domain/models/tier_model_mapper.dart';
import 'local/database.dart';

class TierRepository {
  final Dio _dio;
  final AppDatabase _db;

  TierRepository(this._dio, this._db);

  Stream<List<TierModel>> watchTiers(String programId) {
    return (_db.select(_db.tiers)
          ..where((t) => t.programId.equals(programId))
          ..orderBy([(t) => OrderingTerm(expression: t.pointsRequired, mode: OrderingMode.asc)]))
        .watch()
        .map((rows) => rows.map((row) => TierModelMapper.fromDb(row)).toList());
  }

  Future<TierModel?> getTier(String id) async {
    final row = await (_db.select(_db.tiers)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row != null) {
      return TierModelMapper.fromDb(row);
    }
    return null;
  }

  Future<void> refreshTiers(String programId) async {
    try {
      final response = await _dio.get('/tiers', queryParameters: {'program_id': programId});
      final List<dynamic> data = response.data;

      final models = data.map((json) => TierModel.fromJson(json)).toList();

      await _db.transaction(() async {
        for (final model in models) {
          await _db.into(_db.tiers).insertOnConflictUpdate(model.toDb());
        }
      });
    } catch (e) {
      // print('Failed to fetch tiers from API: $e');
    }
  }

  Future<void> createTier(TierModel tier) async {
    final modelWithId = tier.id.isEmpty ? tier.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString()) : tier;

    try {
      final response = await _dio.post('/tiers/', data: {
        'name': modelWithId.name,
        'points_required': modelWithId.pointsRequired,
        'program_id': modelWithId.programId,
      });

      final serverModel = TierModel.fromJson(response.data);

      await _db.into(_db.tiers).insertOnConflictUpdate(serverModel.toDb());
    } catch (e) {
      // print('Failed to create tier via API: $e');
      await _db.into(_db.tiers).insertOnConflictUpdate(modelWithId.toDb());
    }
  }

  Future<void> updateTier(TierModel tier) async {
    try {
      final response = await _dio.put('/tiers/${tier.id}', data: {
        'name': tier.name,
        'points_required': tier.pointsRequired,
      });

      final serverModel = TierModel.fromJson(response.data);
      await _db.into(_db.tiers).insertOnConflictUpdate(serverModel.toDb());
    } catch (e) {
      // print('Failed to update tier via API: $e');
      await _db.into(_db.tiers).insertOnConflictUpdate(tier.toDb());
    }
  }

  Future<void> deleteTier(String id) async {
     try {
       await _dio.delete('/tiers/$id');
       await (_db.delete(_db.tiers)..where((t) => t.id.equals(id))).go();
     } catch (e) {
       // print('Failed to delete tier via API: $e');
       await (_db.delete(_db.tiers)..where((t) => t.id.equals(id))).go();
     }
  }
}
