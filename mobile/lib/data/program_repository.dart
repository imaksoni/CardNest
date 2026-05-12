import 'package:dio/dio.dart';
import '../domain/models/program_model.dart';
import '../domain/models/program_model_mapper.dart';
import 'local/database.dart';

class ProgramRepository {
  final Dio _dio;
  final AppDatabase _db;

  ProgramRepository(this._dio, this._db);

  Stream<List<ProgramModel>> watchPrograms(String businessId) {
    return (_db.select(_db.programs)..where((t) => t.businessId.equals(businessId)))
        .watch()
        .map((rows) => rows.map((row) => ProgramModelMapper.fromDb(row)).toList());
  }

  Future<ProgramModel?> getProgram(String id) async {
    final row = await (_db.select(_db.programs)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row != null) {
      return ProgramModelMapper.fromDb(row);
    }
    return null;
  }

  Future<void> refreshPrograms(String businessId) async {
    try {
      final response = await _dio.get('/programs', queryParameters: {'business_id': businessId});
      final List<dynamic> data = response.data;

      final models = data.map((json) => ProgramModel.fromJson(json)).toList();

      await _db.transaction(() async {
        for (final model in models) {
          await _db.into(_db.programs).insertOnConflictUpdate(model.toDb());
        }
      });
    } catch (e) {
      // Basic error handling for now
      // print('Failed to fetch programs from API: $e');
    }
  }

  Future<void> createProgram(ProgramModel program) async {
    final modelWithId = program.id.isEmpty ? program.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString()) : program;
    try {
      final response = await _dio.post('/programs/', data: {
        'name': modelWithId.name,
        'description': modelWithId.description,
        'type': modelWithId.type ?? 'loyalty',
        'business_id': modelWithId.businessId,
      });

      // Update with server confirmed result
      final serverModel = ProgramModel.fromJson(response.data);

      await _db.into(_db.programs).insertOnConflictUpdate(serverModel.toDb());
    } catch (e) {
      // print('Failed to create program via API: $e');
      // If offline, just save locally for now
      await _db.into(_db.programs).insertOnConflictUpdate(modelWithId.toDb());
    }
  }

  Future<void> updateProgram(ProgramModel program) async {
    try {
      final response = await _dio.put('/programs/${program.id}', data: {
        'name': program.name,
        'description': program.description,
        'type': program.type,
      });

      final serverModel = ProgramModel.fromJson(response.data);
      await _db.into(_db.programs).insertOnConflictUpdate(serverModel.toDb());
    } catch (e) {
      // print('Failed to update program via API: $e');
      await _db.into(_db.programs).insertOnConflictUpdate(program.toDb());
    }
  }

  Future<void> deleteProgram(String id) async {
     try {
       await _dio.delete('/programs/$id');
       await (_db.delete(_db.programs)..where((t) => t.id.equals(id))).go();
     } catch (e) {
       // print('Failed to delete program via API: $e');
       // Local delete for offline
       await (_db.delete(_db.programs)..where((t) => t.id.equals(id))).go();
     }
  }
}
