import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_model.freezed.dart';
part 'program_model.g.dart';

@freezed

abstract class ProgramModel with _$ProgramModel {
  const factory ProgramModel({
    required String id,
    required String businessId,
    required String name,
    String? description,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _ProgramModel;

  factory ProgramModel.fromJson(Map<String, dynamic> json) => _$ProgramModelFromJson(json);
}
