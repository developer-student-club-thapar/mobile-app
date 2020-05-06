import 'package:dsc_app/screens/home.dart';
import 'package:dsc_app/screens/new_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:dsc_app/database/firestore-user_database.dart';
import 'package:dsc_app/networking/auth.dart';

class Registration extends StatefulWidget {
  final Function toggleView;
  Registration({this.toggleView});
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final AuthService _auth = AuthService();

    String name = '';
    String email = '';
    String gender = '';
    int year = 0;
    bool isThaparStudent = false;
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter name'),
                onSaved: (value) {
                  setState(() {
                    name = value;
                  });
                },
                onChanged: (value) {
                  name = value;
                },
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: 'Enter email'),
                  onSaved: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  onChanged: (value) {
                    email = value;
                  }),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter gender'),
                onSaved: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: 'Enter year'),
                  onSaved: (value) {
                    setState(() {
                      year = int.parse(value);
                    });
                  },
                  onChanged: (value) {
                    year = int.parse(value);
                  }),
              TextFormField(
                  decoration: InputDecoration(hintText: 'thapar student?'),
                  onSaved: (value) {
                    setState(() {
                      if (value == 'yes') {
                        isThaparStudent = true;
                      } else
                        isThaparStudent = false;
                    });
                  },
                  onChanged: (value) {
                    if (value == 'yes') {
                      isThaparStudent = true;
                    } else
                      isThaparStudent = false;
                  }),
              RaisedButton(
                  child: Text('complete registeration'),
                  onPressed: () async {
                    dynamic result = await _auth.signInWithGoogle();
                    if (result != null) {
                      final db = DatabaseService(uid: result.uid);
                      await db
                          .updateUserData(
                              name, email, gender, year, isThaparStudent)
                          .whenComplete(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return NewHome();
                        }), ModalRoute.withName('/register'));
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
