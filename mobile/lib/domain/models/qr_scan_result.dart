import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_result.freezed.dart';
part 'qr_scan_result.g.dart';

@freezed
abstract class QrScanResult with _$QrScanResult {
  const factory QrScanResult({
    required String status,
    String? message,
    String? userName,
    String? businessName,
    String? cardNumber,
    String? tierName,
    int? points,
    DateTime? expiry,
    DateTime? validatedAt,
  }) = _QrScanResult;

  factory QrScanResult.fromJson(Map<String, dynamic> json) => _$QrScanResultFromJson(json);
}
