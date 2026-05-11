import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_history_model.freezed.dart';
part 'qr_scan_history_model.g.dart';

@freezed

abstract class QrScanHistoryModel with _$QrScanHistoryModel {
  const factory QrScanHistoryModel({
    required String id,
    required String scannerId,
    required String qrData,
    required DateTime scanTime,
    required String status,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _QrScanHistoryModel;

  factory QrScanHistoryModel.fromJson(Map<String, dynamic> json) => _$QrScanHistoryModelFromJson(json);
}
