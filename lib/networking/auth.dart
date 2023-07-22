import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc_app/models/user.dart' as usr;
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
//create user obj based on Firebase user
  usr.User _userFromFirebaseUser(User? user) {
    return usr.User(
        uid: user!.uid, name: user.displayName!, image: user.photoURL!);
  }

//auth change user stream
  Stream<usr.User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
  // sign in google

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user!;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Signout user
  Future signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
