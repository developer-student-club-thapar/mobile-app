import 'package:flutter/material.dart';
import 'package:dsc_app/screens/teams.dart';

void main() => runApp(DscApp());

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Team(),
      },
    );
  }
}
