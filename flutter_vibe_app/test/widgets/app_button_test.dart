import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibe_app/shared/widgets/app_button.dart';

void main() {
  testWidgets('AppButton has a text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const CupertinoApp(
        home: AppButton(
          text: 'T',
          onPressed: null,
        ),
      ),
    );
    final textFinder = find.text('T');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('AppButton golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const CupertinoApp(
        home: AppButton(
          text: 'T',
          onPressed: null,
        ),
      ),
    );
    await expectLater(find.byType(AppButton), matchesGoldenFile('app_button.png'));
  });
}
