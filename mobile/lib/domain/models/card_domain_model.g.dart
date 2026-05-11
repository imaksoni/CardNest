// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardDomainModel _$CardDomainModelFromJson(Map<String, dynamic> json) =>
    _CardDomainModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      programId: json['programId'] as String,
      points: (json['points'] as num?)?.toInt() ?? 0,
      currentTierId: json['currentTierId'] as String?,
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

Map<String, dynamic> _$CardDomainModelToJson(_CardDomainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'programId': instance.programId,
      'points': instance.points,
      'currentTierId': instance.currentTierId,
      'localUpdatedAt': instance.localUpdatedAt?.toIso8601String(),
      'serverUpdatedAt': instance.serverUpdatedAt?.toIso8601String(),
      'syncState': instance.syncState,
      'operationId': instance.operationId,
      'isDeleted': instance.isDeleted,
    };
