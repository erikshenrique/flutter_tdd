import 'package:flutter/material.dart';
import 'package:flutter_tdd/Home.dart';

class EmailFieldValidator {
  static String validate(String email) {
    return email.isEmpty ? 'Email não pode ser vazio' : null;
  }
}

class SenhaFieldValidator {
  static String validate(String senha) {
    return senha.isEmpty ? 'Senha não pode ser vazio' : null;
  }
}

class Login extends StatefulWidget {

  final VoidCallback login;

  const Login({this.login});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;
  String _senha;

  bool validarCampos() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> login() async {
    if (validarCampos()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildImages() + buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildImages() {
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 32),
        child: Image.asset("images/logo.png"),
      ),
    ];
  }

  List<Widget> buildInputs() {
    return <Widget>[
     TextFormField(
        key: Key('email'),
        decoration: InputDecoration(labelText: 'Email'),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) => _email = value,
      ),
      Expanded(
        child: TextFormField(
        key: Key('senha'),
        decoration: InputDecoration(labelText: 'Senha'),
        obscureText: true,
        validator: SenhaFieldValidator.validate,
        onSaved: (String value) => _senha = value,
      ),
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    return <Widget>[
      ElevatedButton(
        key: Key('login'),
        child: Text('Login', style: TextStyle(fontSize: 20.0)),
        onPressed: login,
      ),
    ];
  }
}