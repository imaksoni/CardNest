import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme.dart';
import 'sync/sync_engine.dart';
import 'sync/sync_banner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }

  runApp(
    const ProviderScope(
      child: CardNestApp(),
    ),
  );
}

class CardNestApp extends ConsumerStatefulWidget {
  const CardNestApp({super.key});

  @override
  ConsumerState<CardNestApp> createState() => _CardNestAppState();
}

class _CardNestAppState extends ConsumerState<CardNestApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Initial sync
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(syncEngineProvider.notifier).sync();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(syncEngineProvider.notifier).sync();
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'CardNest',
      theme: appTheme,
      routerConfig: router,
      builder: (context, child) {
        return Column(
          children: [
            const SyncStatusBanner(),
            Expanded(child: child ?? const SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
