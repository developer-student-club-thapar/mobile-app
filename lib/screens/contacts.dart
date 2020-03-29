import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/models/contact.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: MyContactForm(),
    );
  }
}

class MyContactForm extends StatefulWidget {
  MyContactForm({Key key}) : super(key: key);
  @override
  _MyContactFormState createState() => _MyContactFormState();
}

class _MyContactFormState extends State<MyContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';
  Future<ContactDetails> _futureContactDetails;

  @override
  Widget build(BuildContext context) {
    return (_futureContactDetails == null)
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Contact form
                  //contact text
                  Center(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        "Connect With Us!",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF676C72),
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  //Name
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      hintText: 'Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                  ),

                  //Email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),

                  //Message
                  Container(
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Enter Message',
                        hintText: 'Message',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Message';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _message = value;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          _formKey.currentState.reset();
                          setState(() {
                            _futureContactDetails =
                                createContactDetails(_name, _email, _message);
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          )
        : FutureBuilder<ContactDetails>(
            future: _futureContactDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.lightBlueAccent),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/contacts');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Successfully Sent! \nSend Another one ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.redAccent),
                    ),
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/contacts');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error! \n Retry',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                );
              }

              return CircularProgressIndicator();
            },
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
