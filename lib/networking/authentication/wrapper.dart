import 'dart:async';

import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:dsc_app/screens/new_home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

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
              child: user == null
                  ? TextTransition(null)
                  : TextTransition(user.name)),
        ],
      ),
    );
  }
}

class TextTransition extends StatefulWidget {
  final String _name;
  TextTransition(this._name);
  @override
  _TextTransitionState createState() => _TextTransitionState();
}

class _TextTransitionState extends State<TextTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
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
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (widget._name == null) {
        if (Navigator.canPop(context)) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
          Navigator.pop(context);
        } else
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
      } else {
        if (Navigator.canPop(context)) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewHome()));
          Navigator.pop(context);
        } else
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewHome()));
      }
    });
    return FutureBuilder(
        future: delay(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FadeTransition(
              opacity: _animation,
              child: Container(
                  child: widget._name != null
                      ? Text(
                          'Welcome ' + widget._name ?? '',
                          style: GoogleFonts.poppins(
                              fontSize: 23, color: Colors.white),
                        )
                      : Text(
                          'Welcome',
                          style: GoogleFonts.poppins(
                              fontSize: 23, color: Colors.white),
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
