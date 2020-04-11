import 'package:dsc_app/models/user.dart';
import 'package:dsc_app/networking/authentication/wrapper.dart';
import 'package:dsc_app/screens/all_events_screen.dart';
import 'package:dsc_app/screens/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/screens/menu_screen.dart';
import 'package:dsc_app/screens/fundus.dart';
import 'package:dsc_app/screens/welcome_screen.dart';
import 'package:dsc_app/screens/login.dart';
import 'package:dsc_app/screens/registration.dart';
import 'package:provider/provider.dart';
import 'screens/teams.dart';
import 'networking/auth.dart';
import 'screens/registration.dart';

void main() => runApp(DscApp());

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Registration(),
          '/menu': (context) => MenuScreen(),
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/register': (context) => Registration(),
          '/welcome': (context) => WelcomeScreen(),
          '/registration': (context) => Registration(),
          '/contactus': (context) => Contacts(),
          '/projects': (context) => Projects(),
          '/events': (context) => AllEvetScreen(),
          '/team': (context) => Team(),
        },
      ),
    );
  }
}
