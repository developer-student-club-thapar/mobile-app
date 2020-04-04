import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/networking/authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else
      return Home();
  }
}
