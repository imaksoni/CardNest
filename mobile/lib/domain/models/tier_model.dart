import 'package:freezed_annotation/freezed_annotation.dart';

part 'tier_model.freezed.dart';
part 'tier_model.g.dart';

@freezed

abstract class TierModel with _$TierModel {
  const factory TierModel({
    required String id,
    required String programId,
    required String name,
    required int pointsRequired,
    String? benefits,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _TierModel;

  factory TierModel.fromJson(Map<String, dynamic> json) => _$TierModelFromJson(json);
}
