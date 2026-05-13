import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:go_router/go_router.dart';
import '../data/qr_scan_repository.dart';
import '../domain/models/qr_scan_request.dart';
import '../domain/models/qr_scan_result.dart';

class QrScanScreen extends ConsumerStatefulWidget {
  const QrScanScreen({super.key});

  @override
  ConsumerState<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends ConsumerState<QrScanScreen> {
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  bool _isProcessing = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _processScan(String qrToken) async {
    if (_isProcessing) return;
    setState(() {
      _isProcessing = true;
    });

    controller.stop();

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final repository = ref.read(qrScanRepositoryProvider);
      final request = QrScanRequest(qrToken: qrToken);
      final result = await repository.validateQr(request);

      // Close loading dialog
      if (mounted) {
        Navigator.of(context).pop();
        await _showValidationResult(result);
      }
    } catch (e) {
        if (mounted) {
            Navigator.of(context).pop(); // Close loading
            await _showValidationResult(QrScanResult(
                status: 'error',
                message: 'An unexpected error occurred: ${e.toString()}',
            ));
        }
    } finally {
        if (mounted) {
            setState(() {
                _isProcessing = false;
            });
        }
    }
  }

  Future<void> _showValidationResult(QrScanResult data) async {
    final isSuccess = data.status == 'validated_online' || data.status == 'pending_sync';
    final icon = isSuccess ? Icons.check_circle : Icons.error;
    final color = isSuccess ? Colors.green : Colors.red;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
            children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(isSuccess ? 'Validation Success' : 'Validation Failed'),
            ]
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.message ?? 'Unknown status'),
            if (isSuccess && data.userName != null) ...[
                const SizedBox(height: 16),
                Text('User: ${data.userName}'),
                Text('Tier: ${data.tierName}'),
                Text('Points: ${data.points}'),
                Text('Card: ${data.cardNumber}'),
            ]
          ],
        ),
        actions: [
          if (isSuccess)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // close dialog
                context.pop(); // go back
              },
              child: const Text('Done'),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.start();
            },
            child: const Text('Scan Another'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Scan Customer QR'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            errorBuilder: (BuildContext context, MobileScannerException error) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 12),
                      Text(
                        'Scanner unavailable',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.errorDetails?.message ?? error.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  _processScan(barcode.rawValue!);
                  break; // Process one at a time
                }
              }
            },
          ),
          // Overlay to guide the user
          Positioned.fill(
              child: IgnorePointer(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                  ),
                  child: Center(
                      child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(12),
                          ),
                      ),
                  ),
              )
              ),
          ),
          Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                          'Position QR code within the frame',
                          style: TextStyle(color: Colors.white),
                      ),
                  ),
              ),
          ),
        ],
      ),
    );
  }
}
