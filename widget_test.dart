import 'package:flutter_test/flutter_test.dart';
import 'package:inson_farosat/main.dart';

void main() {
  testWidgets('Bosh ekranda 4 ta sinf kartasi ko\'rinadi', (tester) async {
    await tester.pumpWidget(const InsonFarosatApp());

    expect(find.text('1-sinf'), findsOneWidget);
    expect(find.text('2-sinf'), findsOneWidget);
    expect(find.text('3-sinf'), findsOneWidget);
    expect(find.text('4-sinf'), findsOneWidget);
    expect(find.text('Darslar'), findsOneWidget);
    expect(find.text('Muloqot'), findsOneWidget);
    expect(find.text('Yangiliklar'), findsOneWidget);
    expect(find.text('Hisob'), findsOneWidget);
  });
}
