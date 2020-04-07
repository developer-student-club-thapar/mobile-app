import 'package:dsc_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:dsc_app/database/firestore-user_database.dart';

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
    final user = Provider.of<User>(context);
    final db = DatabaseService(uid: user.uid);
    String name = '';
    String email = '';
    String gender = '';
    int year = 0;
    bool isThaparStudent = true;
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
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter gender'),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter year'),
                onChanged: (value) {
                  setState(() {
                    year = int.parse(value);
                  });
                },
              ),
              Checkbox(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      isThaparStudent = value;
                    });
                  }),
              RaisedButton(
                  child: Text('complete registeration'),
                  onPressed: () async {
                    await db
                        .updateUserData(
                            name, email, gender, year, isThaparStudent)
                        .whenComplete(() {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }), ModalRoute.withName('/register'));
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
