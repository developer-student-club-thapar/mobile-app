import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/screens/new_home.dart';
import 'package:dsc_app/widgets/welcome_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/networking/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String error = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //DSC Logo here

                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 120.0,
                    child: Image.asset('lib/assets/dsc_logo.png'),
                  ),
                ),

                /*Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    "Log In!",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF676C72),
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                */
                SizedBox(
                  height: 50,
                ),

                //Email
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (value) {
                      setState(
                        () {
                          _email = value;
                        },
                      );
                    },
                  ),
                ),

                //Password
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (value) {
                      setState(
                        () {
                          _email = value;
                        },
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: WelcomeScreenButton(
                    title: 'Submit',
                    colour: blueColor,
                    onPressed: () async {
                      dynamic result = await _auth.signInWithGoogle();
                      if (result == null) {
                        setState(() {
                          error = 'Fail';
                        });
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return NewHome();
                        }), ModalRoute.withName('/login'));
                      }
                    },
                  ),
                ),
                Text(error)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String validateEmail(String value) {
  if (value.isEmpty) {
    return 'Please Enter Your Email';
  }

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
