import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/user.dart';
import 'package:dsc_app/networking/auth.dart';
import 'package:dsc_app/screens/new_home.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final internet = Provider.of<DataConnectionStatus>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: kheight(context) * 0.2,
          ),
          Container(
            height: 200.0,
            child: FlareActor(
              'lib/assets/Menu.flr',
              animation: "loopWaving",
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: internet == DataConnectionStatus.connected
                ? user == null
                    ? TextTransition(
                        name: null,
                        auth: _auth,
                      )
                    : TextTransition(
                        name: user.name,
                        auth: _auth,
                      )
                : FittedBox(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'You are Offline!\nPlease Check your\nInternet Connection Again!',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class TextTransition extends StatefulWidget {
  final String name;
  final AuthService auth;
  TextTransition({this.name, this.auth});

  @override
  _TextTransitionState createState() => _TextTransitionState();
}

class _TextTransitionState extends State<TextTransition> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    Future.delayed(Duration(seconds: 3), () async {
      if (widget.name == null) {
        if (Provider.of<DataConnectionStatus>(context, listen: false) != DataConnectionStatus.connected) return;
        var result = await signIn(widget.auth);
        if (result) {
          if (Navigator.canPop(context)) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewHome()));
            Navigator.pop(context);
          } else
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewHome()));
        }
      } else {
        if (Navigator.canPop(context)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewHome()));
          Navigator.pop(context);
        } else
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewHome()));
      }
    });
    return FutureBuilder(
        future: delay(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FadeTransition(
              opacity: _animation,
              child: Container(
                  child: widget.name != null
                      ? Text(
                          'Welcome ' + widget.name ?? '',
                          style: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
                        )
                      : Text(
                          'Welcome',
                          style: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
                        )),
            );
          } else
            return Container(color: Colors.black);
        });
  }
}

Future delay() async {
  await Future.delayed(Duration(seconds: 1));
  return true;
}

signIn(AuthService authService) async {
  try {
    dynamic result = await authService.signInWithGoogle();
    if (result == null) {
      return false;
    } else
      return true;
  } catch (e) {
    return false;
  }
}
