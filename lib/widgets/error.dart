import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
