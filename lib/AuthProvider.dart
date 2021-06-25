import 'package:flutter/material.dart';

class AuthProvider extends InheritedWidget {
  const AuthProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }
}