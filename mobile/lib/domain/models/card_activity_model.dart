import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_activity_model.freezed.dart';
part 'card_activity_model.g.dart';

@freezed

abstract class CardActivityModel with _$CardActivityModel {
  const factory CardActivityModel({
    required String id,
    required String cardId,
    required int pointsAdded,
    String? description,
    required DateTime timestamp,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _CardActivityModel;

  factory CardActivityModel.fromJson(Map<String, dynamic> json) => _$CardActivityModelFromJson(json);
}
