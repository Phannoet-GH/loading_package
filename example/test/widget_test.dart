import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';
import 'package:loading_package/loading_package.dart';

void main() {
  testWidgets('renders simple LoadingIndicator with message',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(LoadingIndicator), findsOneWidget);
    expect(find.text('Loading data...'), findsOneWidget);
  });
}

