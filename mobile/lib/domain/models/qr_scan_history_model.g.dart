// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrScanHistoryModel _$QrScanHistoryModelFromJson(Map<String, dynamic> json) =>
    _QrScanHistoryModel(
      id: json['id'] as String,
      scannerId: json['scannerId'] as String,
      qrData: json['qrData'] as String,
      scanTime: DateTime.parse(json['scanTime'] as String),
      status: json['status'] as String,
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

Map<String, dynamic> _$QrScanHistoryModelToJson(_QrScanHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scannerId': instance.scannerId,
      'qrData': instance.qrData,
      'scanTime': instance.scanTime.toIso8601String(),
      'status': instance.status,
      'localUpdatedAt': instance.localUpdatedAt?.toIso8601String(),
      'serverUpdatedAt': instance.serverUpdatedAt?.toIso8601String(),
      'syncState': instance.syncState,
      'operationId': instance.operationId,
      'isDeleted': instance.isDeleted,
    };
