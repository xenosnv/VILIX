import 'package:flutter_test/flutter_test.dart';
import 'package:vilix/main.dart';

void main() {
  testWidgets('VilixApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const VilixApp());
    expect(find.byType(VilixApp), findsOneWidget);
  });
}
