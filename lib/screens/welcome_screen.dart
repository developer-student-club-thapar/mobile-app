import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/welcome_screen_button.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('lib/assets/dsc_logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),
                SizedBox(
                  child: ColorizeAnimatedTextKit(
                    speed: Duration(milliseconds: 2000),
                    pause: Duration(milliseconds: 0),
                    isRepeatingAnimation: true,
                    totalRepeatCount: 100,
                    text: [
                      "DSC TIET",
                    ],
                    textStyle: TextStyle(
                      fontSize: 50.0,
                    ),
                    colors: [
                      redColor,
                      blueColor,
                      greenColor,
                      yellowColor,
                    ],
                    textAlign: TextAlign.center,
                    alignment: AlignmentDirectional.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelcomeScreenButton(
              title: 'Log In',
              colour: greenColor,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            WelcomeScreenButton(
              title: 'Register',
              colour: blueColor,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
