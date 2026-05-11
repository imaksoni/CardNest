// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardActivityModel _$CardActivityModelFromJson(Map<String, dynamic> json) =>
    _CardActivityModel(
      id: json['id'] as String,
      cardId: json['cardId'] as String,
      pointsAdded: (json['pointsAdded'] as num).toInt(),
      description: json['description'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
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

Map<String, dynamic> _$CardActivityModelToJson(_CardActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': instance.cardId,
      'pointsAdded': instance.pointsAdded,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'localUpdatedAt': instance.localUpdatedAt?.toIso8601String(),
      'serverUpdatedAt': instance.serverUpdatedAt?.toIso8601String(),
      'syncState': instance.syncState,
      'operationId': instance.operationId,
      'isDeleted': instance.isDeleted,
    };
