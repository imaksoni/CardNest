import 'package:flutter_test/flutter_test.dart';
import 'package:cardnest_mobile/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cardnest_mobile/splash/splash_screen.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: CardNestApp(),
      ),
    );

    // Initial state is Splash screen
    expect(find.byType(SplashScreen), findsOneWidget);

    // We have a 2-second delay in AuthNotifier to simulate loading
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // After loading, it should go to RoleSelectionScreen
    expect(find.text('Welcome to CardNest'), findsOneWidget);
  });
}
