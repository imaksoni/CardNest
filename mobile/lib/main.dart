import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Attempt to initialize Firebase. In a real app, you would pass options:
    // options: DefaultFirebaseOptions.currentPlatform
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

class CardNestApp extends ConsumerWidget {
  const CardNestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'CardNest',
      theme: appTheme,
      routerConfig: router,
    );
  }
}
