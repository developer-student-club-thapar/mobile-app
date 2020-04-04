import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/models/user.dart';

class UserModel extends ChangeNotifier {
  FirebaseUser _user;
  FirebaseUser get userDetails => _user;

  void newUser(FirebaseUser user) {
    user = _user;
    notifyListeners();
  }
}
