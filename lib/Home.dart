import 'package:flutter/material.dart';

class AlcoolFieldValidator {
  static String validate(String valorAlcool) {
    return valorAlcool.isEmpty ? 'Digite o valor do álcool' : null;
  }
}

class GasolinaFieldValidator {
  static String validate(String valorGasolina) {
    return valorGasolina.isEmpty ? 'Digite o valor do gasolina' : null;
  }
}

class Calcular{

  String calcular(double precoAlcool, double precoGasolina) {

    if((precoAlcool / precoGasolina) >= 0.7) {
        return "Melhor abastecer com gasolina";
    } else {
       return "Melhor abastecer com álcool";
    }

  }

}

class Home extends StatefulWidget {

  final VoidCallback calcular;
  const Home({this.calcular});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> validarParaCalcular() async {
    if (validarCampos()) {
      Calcular calcular = Calcular();
      setState(() {
        _textoResultado = calcular.calcular(double.tryParse(_controllerAlcool.text), double.tryParse(_controllerGasolina.text));
      });

    }
  }

  bool validarCampos() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                TextFormField(
                  key: Key('alcool'),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Alcool, ex: 1.59"
                  ),
                  validator: AlcoolFieldValidator.validate,
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerAlcool,
                ),
                TextFormField(
                  key: Key('gasolina'),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 3.59"
                  ),
                  validator: GasolinaFieldValidator.validate,
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    key: Key("calcular"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shadowColor: Colors.white,
                      onSurface: Colors.grey,
                      padding: EdgeInsets.all(15),
                    ),
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      onPressed: validarParaCalcular
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
