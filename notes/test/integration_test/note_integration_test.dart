import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration test notes', () {
    testWidgets('Test add notes', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.widgetWithText(TextField, 'Заголовок'), 'Hello');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('Integration test delete notes', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.widgetWithText(TextField, 'Заголовок'), 'Hello');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);

      await tester.tap(find.text('Hello'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsNothing);
    });

    testWidgets('Test update note', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.widgetWithText(TextField, 'Заголовок'), 'Hello');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);

      await tester.tap(find.text('Hello'));
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextField, 'Hello'), 'Hi');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back_ios));
      await tester.pumpAndSettle();

      expect(find.text('Hi'), findsOneWidget);
    });
    testWidgets('Test cancel editing note', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.widgetWithText(TextField, 'Заголовок'), 'Hello');
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hello'));
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextField, 'Hello'), 'Hi');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);
      expect(find.text('Hi'), findsNothing);
    });
  });
}
