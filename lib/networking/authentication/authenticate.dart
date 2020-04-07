import 'package:flutter/material.dart';
import 'package:dsc_app/screens/login.dart';
import 'package:dsc_app/screens/registration.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleView: toggleView);
    } else
      return Registration(toggleView: toggleView);
  }
}
