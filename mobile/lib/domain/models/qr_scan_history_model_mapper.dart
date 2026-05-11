import '../../data/local/database.dart' as db;
import 'package:drift/drift.dart' show Value;
import 'qr_scan_history_model.dart';

extension QrScanHistoryModelMapper on QrScanHistoryModel {
  static QrScanHistoryModel fromDb(db.QrScanHistory dbQrScanHistory) {
    return QrScanHistoryModel(
      id: dbQrScanHistory.id,
      scannerId: dbQrScanHistory.scannerId,
      qrData: dbQrScanHistory.qrData,
      scanTime: dbQrScanHistory.scanTime,
      status: dbQrScanHistory.status,
      localUpdatedAt: dbQrScanHistory.localUpdatedAt,
      serverUpdatedAt: dbQrScanHistory.serverUpdatedAt,
      syncState: dbQrScanHistory.syncState,
      operationId: dbQrScanHistory.operationId,
      isDeleted: dbQrScanHistory.isDeleted,
    );
  }

  db.QrScanHistoriesCompanion toDb() {
    return db.QrScanHistoriesCompanion.insert(
      id: id,
      scannerId: scannerId,
      qrData: qrData,
      scanTime: scanTime,
      status: status,
      localUpdatedAt: Value(localUpdatedAt),
      serverUpdatedAt: Value(serverUpdatedAt),
      syncState: Value(syncState),
      operationId: Value(operationId),
      isDeleted: Value(isDeleted),
    );
  }
}
