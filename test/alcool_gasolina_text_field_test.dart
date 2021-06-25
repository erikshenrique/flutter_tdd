import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tdd/Home.dart';

void main() {

  test('Álcool está vazio', () {

    final result = AlcoolFieldValidator.validate('');
    expect(result, 'Digite o valor do álcool');
  });

  test('Álcool preenchido', () {

    final result = AlcoolFieldValidator.validate('1.50');
    expect(result, null);
  });

  test('Gasolina está vazio', () {

    final result = GasolinaFieldValidator.validate('');
    expect(result, 'Digite o valor do gasolina');
  });

  test('Gasolina preenchido', () {

    final result = GasolinaFieldValidator.validate('3.50');
    expect(result, null);
  });
  
  test('Calculo Alcool', () {
    
    Calcular calcular = Calcular();
    
    String resultado = calcular.calcular(1.50, 3.50);

    expect(resultado, "Melhor abastecer com álcool");
    
  });

  test('Calculo Gasolina', () {

    Calcular calcular = Calcular();

    String resultado = calcular.calcular(3.50, 1.50);

    expect(resultado, "Melhor abastecer com gasolina");

  });

}