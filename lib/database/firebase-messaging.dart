import 'package:dsc_app/screens/all_events_screen.dart';
import 'package:dsc_app/screens/new_home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications {
  final BuildContext context;
  final Function toEvent;
  final Function toProject;
  Notifications({this.context, this.toEvent, this.toProject});

  final FirebaseMessaging fcm = FirebaseMessaging();

  void initialise() {
    fcm.configure(onMessage: (Map<String, dynamic> message) async {
      print("onMessage , $message");
      final snackbar = SnackBar(
        content: Text(message['notification']['title']),
        action: SnackBarAction(
          label: 'Go',
          onPressed: () => message['notification']['type'] == 'event'
              ? toEvent()
              : toProject(),
        ),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch : $message");
      if (message['notification']['type'] == 'event')
        toEvent();
      else if (message['notification']['type'] == 'project')
        toProject();
      else {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => NewHome()));
      }
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume : $message");
      if (message['notification']['type'] == 'event')
        toEvent();
      else if (message['notification']['type'] == 'project')
        toProject();
      else {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => NewHome()));
      }
    });
  }
}
