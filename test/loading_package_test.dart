import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loading_package/loading_package.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  testWidgets('LoadingIndicator renders CircularProgressIndicator and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(
            message: 'Loading test...',
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Loading test...'), findsOneWidget);
  });

  testWidgets('PopupLoading show and hide displays dialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => PopupLoading.show(
                context,
                message: 'Please wait...',
              ),
              child: const Text('Show'),
            ),
          ),
        ),
      ),
    );

    // Open popup
    await tester.tap(find.text('Show'));
    await tester.pump();

    expect(PopupLoading.isShowing, isTrue);
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Please wait...'), findsOneWidget);

    // Hide popup
    final element = tester.element(find.byType(Dialog));
    PopupLoading.hide(element);
    await tester.pumpAndSettle();

    expect(PopupLoading.isShowing, isFalse);
    expect(find.byType(Dialog), findsNothing);
  });
}
