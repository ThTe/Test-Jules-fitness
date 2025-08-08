// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobility_check_progress/main.dart';

void main() {
  testWidgets('App starts and displays home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MobilityApp());

    // Verify that the AppBar title of the HomeScreen is present.
    expect(find.text('Tableau de Bord'), findsOneWidget);

    // Verify that the main button to start a new test is present.
    expect(find.text('LANCER UN NOUVEAU TEST'), findsOneWidget);
  });
}
