import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dsc_app/screens/teams.dart';
import 'package:dsc_app/screens/contacts.dart';
void main() => runApp(DscApp());

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Team(),
        '/menu': (context) => MenuScreen(),
        '/home': (context) => Home(),
        '/contacts': (context) => Contacts(),

      },
      
    );
  }
}
