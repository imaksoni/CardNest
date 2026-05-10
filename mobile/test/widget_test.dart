import 'package:flutter_test/flutter_test.dart';
import 'package:cardnest_mobile/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: CardNestApp(),
      ),
    );

    // Verify that the Auth Screen Placeholder is there, as it's the initial route.
    expect(find.text('Auth Screen Placeholder'), findsOneWidget);
  });
}
