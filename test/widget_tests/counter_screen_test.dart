import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsdstartertest/src/counter_bloc.dart';
import 'package:fsdstartertest/src/counter_screen.dart';
import 'package:provider/provider.dart';

main() {
  group("Counter Screen...", () {
    testWidgets("can display the text when provider value is null",
        (WidgetTester tester) async {
      await tester.pumpWidget(Provider<CounterBlocModel>.value(
        value: null,
        child: CounterScreen(),
      ));
      final textWidget = find.byType(Text);
      expect(textWidget, findsOneWidget);
    });
  });
}
