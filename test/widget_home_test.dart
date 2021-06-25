import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tdd/AuthProvider.dart';
import 'package:flutter_tdd/Home.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return AuthProvider(
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('álcool e gasolina vazio, não realiza o calculo', (WidgetTester tester) async {

    bool calcular = false;
    Home page = Home(calcular: () => calcular = true);

    await tester.pumpWidget(makeTestableWidget(child: page));

    await tester.tap(find.byKey(Key('calcular')));
    await tester.pump();

    expect(calcular, false);

  });

  testWidgets('álcool e gasolina preenchidos, login com sucesso', (WidgetTester tester) async {

    bool calcular = true;
    Home page = Home(calcular: () => calcular = true);

    await tester.pumpWidget(makeTestableWidget(child: page));

    Finder alcoolField = find.byKey(Key('alcool'));
    await tester.enterText(alcoolField, '1.50');

    Finder gasolinaField = find.byKey(Key('gasolina'));
    await tester.enterText(gasolinaField, '3.50');

    await tester.tap(find.byKey(Key('calcular')));
    await tester.pump();

    expect(calcular, true);

  });

}