import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sync_engine.dart';
import '../data/user_repository.dart';

class SyncStatusBanner extends ConsumerWidget {
  const SyncStatusBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncEngineProvider);
    final db = ref.watch(appDatabaseProvider);

    if (syncState == SyncState.idle) {
      return const SizedBox.shrink();
    }

    Color bgColor = Colors.blue;
    String message = 'Syncing...';
    IconData icon = Icons.sync;

    if (syncState == SyncState.error) {
      bgColor = Colors.red;
      message = 'Sync failed. Retrying later.';
      icon = Icons.error_outline;
    } else if (syncState == SyncState.offline) {
      bgColor = Colors.orange;
      message = 'Offline. Changes saved locally.';
      icon = Icons.cloud_off;
    }

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (syncState == SyncState.syncing)
              const SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            else
              Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            StreamBuilder(
              stream: db.select(db.syncQueues).watch(),
              builder: (context, snapshot) {
                final pendingCount = snapshot.data?.where((i) => i.retryCount < 9999).length ?? 0;
                final failedCount = snapshot.data?.where((i) => i.retryCount == 9999).length ?? 0;
                String suffix = pendingCount > 0 ? ' ($pendingCount pending)' : '';
                if (failedCount > 0) suffix += ' ($failedCount failed)';
                return Text(
                  '$message$suffix',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
