import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
final FirebaseAuth _auth = FirebaseAuth.instance;


class AuthService extends ChangeNotifier {
//create user obj based on Firebase user


  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid, email: user.email, name: user.displayName)
        : null;
  }

//auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in google

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      var token = user.getIdToken();

      final FirebaseUser currentUser = await _auth.currentUser();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Name', currentUser.displayName);
      prefs.setString('Email', currentUser.email);


      return currentUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and pass

  void signOut() async {
    try {

        await _googleSignIn.signOut();
        print("signed out");

    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// storing user data



