// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) =>
    _ProgramModel(
      id: json['id'] as String,
      businessId: json['businessId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      localUpdatedAt: json['localUpdatedAt'] == null
          ? null
          : DateTime.parse(json['localUpdatedAt'] as String),
      serverUpdatedAt: json['serverUpdatedAt'] == null
          ? null
          : DateTime.parse(json['serverUpdatedAt'] as String),
      syncState: json['syncState'] as String?,
      operationId: json['operationId'] as String?,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ProgramModelToJson(_ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessId': instance.businessId,
      'name': instance.name,
      'description': instance.description,
      'localUpdatedAt': instance.localUpdatedAt?.toIso8601String(),
      'serverUpdatedAt': instance.serverUpdatedAt?.toIso8601String(),
      'syncState': instance.syncState,
      'operationId': instance.operationId,
      'isDeleted': instance.isDeleted,
    };
