// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrScanResult _$QrScanResultFromJson(Map<String, dynamic> json) =>
    _QrScanResult(
      status: json['status'] as String,
      message: json['message'] as String?,
      userName: json['userName'] as String?,
      businessName: json['businessName'] as String?,
      cardNumber: json['cardNumber'] as String?,
      tierName: json['tierName'] as String?,
      points: (json['points'] as num?)?.toInt(),
      expiry: json['expiry'] == null
          ? null
          : DateTime.parse(json['expiry'] as String),
      validatedAt: json['validatedAt'] == null
          ? null
          : DateTime.parse(json['validatedAt'] as String),
    );

Map<String, dynamic> _$QrScanResultToJson(_QrScanResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'userName': instance.userName,
      'businessName': instance.businessName,
      'cardNumber': instance.cardNumber,
      'tierName': instance.tierName,
      'points': instance.points,
      'expiry': instance.expiry?.toIso8601String(),
      'validatedAt': instance.validatedAt?.toIso8601String(),
    };
