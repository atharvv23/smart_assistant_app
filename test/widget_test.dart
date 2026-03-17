import 'package:flutter_test/flutter_test.dart';
import 'package:smart_assistant_app/app.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartAssistantApp());
    expect(find.text('Smart Assistant'), findsOneWidget);
  });
}