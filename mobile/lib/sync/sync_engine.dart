import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../data/local/database.dart';
import '../core/api_client.dart';
import '../data/user_repository.dart';
import 'package:drift/drift.dart' as drift;

import '../domain/models/profile_model.dart';
import '../domain/models/business_model.dart';
import '../domain/models/program_model.dart';
import '../domain/models/tier_model.dart';
import '../domain/models/card_domain_model.dart';
import '../domain/models/card_activity_model.dart';
import '../domain/models/profile_model_mapper.dart';
import '../domain/models/business_model_mapper.dart';
import '../domain/models/program_model_mapper.dart';
import '../domain/models/tier_model_mapper.dart';
import '../domain/models/card_domain_model_mapper.dart';
import '../domain/models/card_activity_model_mapper.dart';

enum SyncState { idle, syncing, error, offline }

class SyncEngine extends Notifier<SyncState> {
  late final AppDatabase _db;
  late final Dio _dio;
  final _uuid = const Uuid();

  @override
  SyncState build() {
    _db = ref.watch(appDatabaseProvider);
    _dio = ref.watch(apiClientProvider);
    return SyncState.idle;
  }

  Future<void> enqueueOperation(String operationType, String modelName, String entityId, Map<String, dynamic> payload) async {
    if (!payload.containsKey('operationId') && !payload.containsKey('operation_id')) {
      payload['operation_id'] = _uuid.v4();
    }

    final encodedPayload = jsonEncode(payload);

    await _db.into(_db.syncQueues).insert(
      SyncQueuesCompanion.insert(
        operationType: operationType,
        modelName: modelName,
        entityId: entityId,
        payload: encodedPayload,
        createdAt: DateTime.now(),
      )
    );
  }

  Future<void> pullUpdates() async {
    try {
      final meta = await (_db.select(_db.syncMetadatas)..where((t) => t.modelName.equals('global'))).getSingleOrNull();
      final lastSyncedAt = meta?.lastSyncedAt;

      final queryParams = <String, dynamic>{};
      if (lastSyncedAt != null) {
        queryParams['updated_since'] = lastSyncedAt.toUtc().toIso8601String();
      }

      final response = await _dio.get('/sync/pull', queryParameters: queryParams);
      final data = response.data;

      if (data['profiles'] != null) {
        for (final item in data['profiles']) {
          final p = ProfileModel.fromJson(item);
          await _db.into(_db.profiles).insertOnConflictUpdate(p.toDb());
        }
      }

      if (data['businesses'] != null) {
        for (final item in data['businesses']) {
          final b = BusinessModel.fromJson(item);
          await _db.into(_db.businesses).insertOnConflictUpdate(b.toDb());
        }
      }

      if (data['programs'] != null) {
        for (final item in data['programs']) {
          final p = ProgramModel.fromJson(item);
          await _db.into(_db.programs).insertOnConflictUpdate(p.toDb());
        }
      }

      if (data['tiers'] != null) {
        for (final item in data['tiers']) {
          final t = TierModel.fromJson(item);
          await _db.into(_db.tiers).insertOnConflictUpdate(t.toDb());
        }
      }

      if (data['cards'] != null) {
        for (final item in data['cards']) {
          final c = CardDomainModel.fromJson(item);
          await _db.into(_db.cards).insertOnConflictUpdate(c.toDb());
        }
      }

      if (data['card_activities'] != null) {
        for (final item in data['card_activities']) {
          final ca = CardActivityModel.fromJson(item);
          await _db.into(_db.cardActivities).insertOnConflictUpdate(ca.toDb());
        }
      }

      await _db.into(_db.syncMetadatas).insertOnConflictUpdate(
        SyncMetadatasCompanion.insert(
          modelName: 'global',
          lastSyncedAt: DateTime.now(),
        )
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> processQueue() async {
    final queueItems = await _db.select(_db.syncQueues).get();
    final activeQueueItems = queueItems.where((i) => i.retryCount < 9999).toList();
    if (activeQueueItems.isEmpty) return;

    final operations = activeQueueItems.map((item) {
      return {
        'id': item.id,
        'operationType': item.operationType,
        'modelName': item.modelName,
        'entityId': item.entityId,
        'payload': jsonDecode(item.payload),
      };
    }).toList();

    try {
      final response = await _dio.post('/sync/push', data: {'operations': operations});

      if (response.statusCode == 200) {
        final failedOps = response.data['failed_operations'] as List<dynamic>? ?? [];
        final failedIds = failedOps.map((f) => f['entityId']).toSet();

        for (final item in queueItems) {
          if (!failedIds.contains(item.entityId)) {
             await (_db.delete(_db.syncQueues)..where((t) => t.id.equals(item.id))).go();
          } else {
             // Optionally mark permanent failure if conflict detected
          }
        }
      }
    } catch (e) {
      for (final item in queueItems) {
        final newRetry = item.retryCount + 1;
        if (newRetry > 10) {
          // Mark for manual review by keeping it in the queue but stop trying
          await (_db.update(_db.syncQueues)..where((t) => t.id.equals(item.id)))
            .write(SyncQueuesCompanion(retryCount: drift.Value(9999)));
        } else {
          await (_db.update(_db.syncQueues)..where((t) => t.id.equals(item.id)))
            .write(SyncQueuesCompanion(retryCount: drift.Value(newRetry)));
        }
      }
      rethrow;
    }
  }

  Future<void> sync() async {
    if (state == SyncState.syncing) return;

    state = SyncState.syncing;
    try {
      await pullUpdates();
      await processQueue();
      state = SyncState.idle;
    } catch (e) {
      state = SyncState.error;
    }
  }
}

final syncEngineProvider = NotifierProvider<SyncEngine, SyncState>(() {
  return SyncEngine();
});
