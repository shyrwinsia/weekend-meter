import 'package:flutter_test/flutter_test.dart';
import 'package:weekendmeter/main.dart';
import 'package:weekendmeter/weekend.dart';

void main() {
  testWidgets('Smoke Test: Check if it loads', (WidgetTester tester) async {
    await tester.pumpWidget(WeekendMeterApp());

    if (WeekendUtility.isItWeekendAlready()) {
      expect(find.text('left of your weekend'), findsOneWidget);
    } else {
      expect(find.text('It\'s not yet the weekend.\nGet back to work.'),
          findsOneWidget);
    }
  });
}
