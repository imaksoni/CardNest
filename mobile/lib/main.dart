import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router.dart';
import 'core/theme.dart';

void main() {
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
    return MaterialApp.router(
      title: 'CardNest',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
