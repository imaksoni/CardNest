import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../core/api_client.dart';
import '../domain/models/qr_scan_request.dart';
import '../domain/models/qr_scan_result.dart';

final qrScanRepositoryProvider = Provider<QrScanRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  return QrScanRepository(dio);
});

class QrScanRepository {
  final Dio _dio;

  QrScanRepository(this._dio);

  Future<QrScanResult> validateQr(QrScanRequest request) async {
    try {
      final response = await _dio.post(
        '/qr_validation/validate',
        data: request.toJson(),
      );

      final data = response.data as Map<String, dynamic>;

      return QrScanResult(
        status: data['status'] == 'success' ? 'validated_online' : data['status'],
        message: data['message'],
        userName: data['user_name'],
        businessName: data['business_name'],
        cardNumber: data['card_number'],
        tierName: data['tier_name'],
        points: data['points'],
        expiry: data['expiry'] != null ? DateTime.parse(data['expiry']) : null,
        validatedAt: data['validated_at'] != null ? DateTime.parse(data['validated_at']) : null,
      );
    } on DioException catch (e) {
      // TODO: Prepare for optional offline scan queue here (Prompt 12).
      // If the error is network-related (e.g. connection timeout or no internet),
      // we could save the scan event locally and return a simulated success
      // or "pending_sync" status to be synced later.

      String errorMessage = 'Failed to validate QR code';
      String status = 'error';

      if (e.response != null && e.response?.data != null) {
          if (e.response!.data is Map<String, dynamic>) {
            errorMessage = e.response!.data['message'] ?? errorMessage;
            status = e.response!.data['status'] ?? status;
          } else if (e.response!.data is String) {
              errorMessage = e.response!.data;
          }
      }

      return QrScanResult(
          status: status,
          message: errorMessage,
      );
    } catch (e) {
       return QrScanResult(
           status: 'error',
           message: 'An unexpected error occurred: ${e.toString()}',
       );
    }
  }
}
