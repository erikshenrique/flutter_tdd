import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tdd/Login.dart';
import 'package:flutter_tdd/AuthProvider.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return AuthProvider(
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('email e senha vazio, não realiza login', (WidgetTester tester) async {

    bool login = false;
    Login page = Login(login: () => login = true);

    await tester.pumpWidget(makeTestableWidget(child: page));

    await tester.tap(find.byKey(Key('login')));
    await tester.pump();

    expect(login, false);

  });

  testWidgets('login e senha preenchidos, login com sucesso', (WidgetTester tester) async {

    bool login = true;
    Login page = Login(login: () => login = true);

    await tester.pumpWidget(makeTestableWidget(child: page));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'eriks.santos');

    Finder senhaField = find.byKey(Key('senha'));
    await tester.enterText(senhaField, '123456');

    await tester.tap(find.byKey(Key('login')));
    await tester.pump();

    expect(login, true);

  });

}