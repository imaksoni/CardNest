import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/api_client.dart';

final qrTokenProvider = FutureProvider.autoDispose.family<String, int>((ref, cardId) async {
  final dio = ref.watch(apiClientProvider);
  final response = await dio.post(
    '/qr_validation/generate',
    data: {'card_id': cardId},
  );
  return response.data['qr_token'] as String;
});

class QrGeneratorDialog extends ConsumerWidget {
  final int cardId;

  const QrGeneratorDialog({super.key, required this.cardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrTokenAsync = ref.watch(qrTokenProvider(cardId));

    return AlertDialog(
      title: const Text('Scan at Register'),
      content: SizedBox(
        width: 300,
        height: 300,
        child: qrTokenAsync.when(
          data: (token) => Center(
            child: QrImageView(
              data: token,
              version: QrVersions.auto,
              size: 250.0,
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                const Text('Failed to generate QR code', textAlign: TextAlign.center),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => ref.refresh(qrTokenProvider(cardId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
