// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessModel _$BusinessModelFromJson(Map<String, dynamic> json) =>
    _BusinessModel(
      id: json['id'] as String,
      name: json['name'] as String,
      ownerId: json['ownerId'] as String?,
      description: json['description'] as String?,
      logoUrl: json['logoUrl'] as String?,
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

Map<String, dynamic> _$BusinessModelToJson(_BusinessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerId': instance.ownerId,
      'description': instance.description,
      'logoUrl': instance.logoUrl,
      'localUpdatedAt': instance.localUpdatedAt?.toIso8601String(),
      'serverUpdatedAt': instance.serverUpdatedAt?.toIso8601String(),
      'syncState': instance.syncState,
      'operationId': instance.operationId,
      'isDeleted': instance.isDeleted,
    };
