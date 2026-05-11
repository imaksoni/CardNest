// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TierModel _$TierModelFromJson(Map<String, dynamic> json) => _TierModel(
  id: json['id'] as String,
  programId: json['programId'] as String,
  name: json['name'] as String,
  pointsRequired: (json['pointsRequired'] as num).toInt(),
  benefits: json['benefits'] as String?,
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

Map<String, dynamic> _$TierModelToJson(_TierModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'programId': instance.programId,
      'name': instance.name,
      'pointsRequired': instance.pointsRequired,
      'benefits': instance.benefits,
      'localUpdatedAt': instance.localUpdatedAt?.toIso8601String(),
      'serverUpdatedAt': instance.serverUpdatedAt?.toIso8601String(),
      'syncState': instance.syncState,
      'operationId': instance.operationId,
      'isDeleted': instance.isDeleted,
    };
