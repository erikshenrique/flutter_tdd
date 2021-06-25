import 'package:flutter/material.dart';
import 'package:flutter_tdd/Login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Álcool ou Gasolina',
      color: Colors.blue,
      home: Login(),
    );
  }
}
