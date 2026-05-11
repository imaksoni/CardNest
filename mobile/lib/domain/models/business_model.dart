import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_model.freezed.dart';
part 'business_model.g.dart';

@freezed
abstract class BusinessModel with _$BusinessModel {
  const factory BusinessModel({
    required String id,
    required String name,
    String? ownerId,
    String? description,
    String? logoUrl,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _BusinessModel;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => _$BusinessModelFromJson(json);
}
