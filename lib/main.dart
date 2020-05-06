import 'package:dsc_app/screens/new_home.dart';
import 'package:dsc_app/screens/news_view.dart';
import 'package:dsc_app/models/user.dart';
import 'package:dsc_app/networking/authentication/wrapper.dart';
import 'package:dsc_app/screens/all_events_screen.dart';
import 'package:dsc_app/screens/profile.dart';
import 'package:dsc_app/screens/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dsc_app/screens/menu_screen.dart';
import 'package:dsc_app/screens/fundus.dart';
import 'package:dsc_app/screens/welcome_screen.dart';
import 'package:dsc_app/screens/login.dart';
import 'package:dsc_app/screens/registration.dart';
import 'package:google_fonts/google_fonts.dart';
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
        theme: ThemeData(
          cardColor: Color.fromRGBO(217, 217, 217, 0.1),
          scaffoldBackgroundColor: Colors.black,
          iconTheme: IconThemeData(
              color: Color.fromRGBO(255, 255, 255, 0.3), size: 40),
          textTheme: TextTheme(
              headline2: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
              headline3: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
              headline5: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 18),
              headline6: GoogleFonts.poppins(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 15.0,
              ),
              headline4: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodyText1: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
              bodyText2: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 10),
              subtitle1: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 0.3)),
              subtitle2: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 0.5))),

          // brightness: Brightness.dark
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Wrapper(),
          '/menu': (context) => MenuScreen(),
          '/home': (context) => NewHome(),
          '/login': (context) => Login(),
          '/register': (context) => Registration(),
          '/welcome': (context) => WelcomeScreen(),
          '/registration': (context) => Registration(),
          '/contactus': (context) => Contacts(),
          '/projects': (context) => Projects(),
          '/events': (context) => AllEvetScreen(),
          '/team': (context) => Team(),
          '/news': (context) => NewsView(),
          '/profile': (context) => Profile(),
          '/nhome': (context) => NewHome()
        },
      ),
    );
  }
}
