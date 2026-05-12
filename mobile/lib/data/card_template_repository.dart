import 'package:dio/dio.dart';
import '../domain/models/card_template_model.dart';
import '../domain/models/card_template_model_mapper.dart';
import 'local/database.dart';

class CardTemplateRepository {
  final Dio _dio;
  final AppDatabase _db;

  CardTemplateRepository(this._dio, this._db);

  Stream<List<CardTemplateModel>> watchCardTemplate(String tierId) {
    return (_db.select(_db.cardTemplates)..where((t) => t.tierId.equals(tierId)))
        .watch()
        .map((rows) => rows.map((row) => CardTemplateModelMapper.fromDb(row)).toList());
  }

  Future<CardTemplateModel?> getCardTemplate(String id) async {
    final row = await (_db.select(_db.cardTemplates)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row != null) {
      return CardTemplateModelMapper.fromDb(row);
    }
    return null;
  }

  Future<void> refreshCardTemplates(String tierId) async {
    try {
      final response = await _dio.get('/cards/templates', queryParameters: {'tier_id': tierId});
      final List<dynamic> data = response.data;

      final models = data.map((json) => CardTemplateModel.fromJson(json)).toList();

      await _db.transaction(() async {
        for (final model in models) {
          await _db.into(_db.cardTemplates).insertOnConflictUpdate(model.toDb());
        }
      });
    } catch (e) {
      // print('Failed to fetch card templates from API: $e');
    }
  }

  Future<void> createCardTemplate(CardTemplateModel template) async {
    final modelWithId = template.id.isEmpty ? template.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString()) : template;

    try {
      final response = await _dio.post('/cards/templates', data: {
        'tier_id': modelWithId.tierId,
        'colors': modelWithId.colors,
        'bg_image': modelWithId.bgImage,
        'label_styling': modelWithId.labelStyling,
        'business_name': modelWithId.businessName,
        'tier_name': modelWithId.tierName,
      });

      final serverModel = CardTemplateModel.fromJson(response.data);

      await _db.into(_db.cardTemplates).insertOnConflictUpdate(serverModel.toDb());
    } catch (e) {
      // print('Failed to create card template via API: $e');
      await _db.into(_db.cardTemplates).insertOnConflictUpdate(modelWithId.toDb());
    }
  }

  Future<void> updateCardTemplate(CardTemplateModel template) async {
    try {
      final response = await _dio.put('/cards/templates/${template.id}', data: {
        'colors': template.colors,
        'bg_image': template.bgImage,
        'label_styling': template.labelStyling,
        'business_name': template.businessName,
        'tier_name': template.tierName,
      });

      final serverModel = CardTemplateModel.fromJson(response.data);
      await _db.into(_db.cardTemplates).insertOnConflictUpdate(serverModel.toDb());
    } catch (e) {
      // print('Failed to update card template via API: $e');
      await _db.into(_db.cardTemplates).insertOnConflictUpdate(template.toDb());
    }
  }

  Future<void> deleteCardTemplate(String id) async {
     try {
       await _dio.delete('/cards/templates/$id');
       await (_db.delete(_db.cardTemplates)..where((t) => t.id.equals(id))).go();
     } catch (e) {
       // print('Failed to delete card template via API: $e');
       await (_db.delete(_db.cardTemplates)..where((t) => t.id.equals(id))).go();
     }
  }
}
