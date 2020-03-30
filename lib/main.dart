import 'package:dsc_app/screens/all_events_screen.dart';
import 'package:dsc_app/screens/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/screens/menu_screen.dart';
import 'package:dsc_app/screens/contacts.dart';
import 'screens/teams.dart';
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
      routes: {
        '/': (context) => Home(),
        '/menu': (context) => MenuScreen(),
        '/home': (context) => Home(),
        '/contactus': (context) => Contacts(),
        '/projects':(context) => Projects(),
        '/events':(context)=>AllEvetScreen(),
        '/team':(context)=>Team(),

      },
      
    );
  }
}
