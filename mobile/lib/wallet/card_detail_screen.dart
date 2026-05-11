import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'loyalty_card_widget.dart';
import '../core/widgets.dart';
import 'offline_banner.dart';

class CardDetailScreen extends ConsumerWidget {
  final Map<String, dynamic> cardData;

  const CardDetailScreen({super.key, required this.cardData});

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString));
    } catch (e) {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData['business_name'] ?? 'Card Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // In a real app we'd determine if the data is stale/cached
            const OfflineBanner(isOffline: false),
            const SizedBox(height: 16),
            Hero(
              tag: 'card_${cardData['id']}',
              child: LoyaltyCardWidget(
                cardNumber: cardData['card_number'] ?? '',
                userName: cardData['user_name'] ?? '',
                businessName: cardData['business_name'] ?? '',
                tierName: cardData['tier_name'] ?? '',
                points: cardData['points'] ?? 0,
                expiry: cardData['expiry'],
                cvv: cardData['cvv'] ?? '',
                visualColor: _parseColor(cardData['visual_color'] ?? '0xFF607D8B'),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Available Points',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${cardData['points'] ?? 0}',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: 0.6, // Mock progress to next tier
                          backgroundColor: Colors.grey.shade300,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '400 points to next tier',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    text: 'View Activity History',
                    onPressed: () {
                      context.push('/card_activity', extra: cardData['id']);
                    },
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      // Show QR for scanning at register
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Show QR Code to Cashier'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
