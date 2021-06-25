import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tdd/Login.dart';

void main() {

  test('Email está vazio', () {

    final result = EmailFieldValidator.validate('');
    expect(result, 'Email não pode ser vazio');
  });

  test('Email preenchido', () {

    final result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('Senha está vazio', () {

    final result = SenhaFieldValidator.validate('');
    expect(result, 'Senha não pode ser vazio');
  });

  test('Senha preenchida', () {

    final result = SenhaFieldValidator.validate('password');
    expect(result, null);
  });

}