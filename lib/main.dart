import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';


import 'package:dsc_app/screens/teams.dart';

void main() => runApp(DscApp());

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Team(),
        '/menu': (context) => MenuScreen(),
        '/home': (context) => Home(),
      },
    );
  }
}
