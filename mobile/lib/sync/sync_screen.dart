import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sync_engine.dart';

class SyncScreen extends ConsumerWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sync')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ref.read(syncEngineProvider.notifier).sync();
          },
          icon: const Icon(Icons.sync),
          label: const Text('Manual Refresh'),
        ),
      ),
    );
  }
}
