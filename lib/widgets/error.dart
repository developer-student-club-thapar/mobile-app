import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          child: Image.asset(
            'lib/assets/undraw_page_not_found_su7k.png',
          ),
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.redAccent),
          ),
          color: Colors.redAccent,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/contacts');
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              'Error! \n Retry',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
