import 'package:flutter_test/flutter_test.dart';
import 'package:mobility_check_progress/main.dart';
import 'package:mobility_check_progress/providers/test_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App starts and displays home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We need to wrap MobilityApp with the same providers as in main.dart
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TestProvider()),
        ],
        child: const MobilityApp(),
      ),
    );

    // Verify that the AppBar title of the HomeScreen is present.
    expect(find.text('Tableau de Bord'), findsOneWidget);

    // Verify that the main button to start a new test is present.
    expect(find.text('LANCER UN NOUVEAU TEST'), findsOneWidget);

    // Verify the initial score is displayed.
    expect(find.text('0/100'), findsOneWidget);
  });
}
