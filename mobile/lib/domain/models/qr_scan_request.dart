import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_request.freezed.dart';
part 'qr_scan_request.g.dart';

@freezed
abstract class QrScanRequest with _$QrScanRequest {
  const factory QrScanRequest({
    required String qrToken,
  }) = _QrScanRequest;

  factory QrScanRequest.fromJson(Map<String, dynamic> json) => _$QrScanRequestFromJson(json);
}
