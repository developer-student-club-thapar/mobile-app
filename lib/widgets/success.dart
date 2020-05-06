import 'package:flutter/material.dart';
import 'package:dsc_app/constants/constants.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Image.asset(
              'lib/assets/undraw_Mail_sent_qwwx.png',
            ),
          ),
          SizedBox(height: 20),
          RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/contactus');
            },
            color: blueColor,
            textColor: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                'Successfully Sent! \nSend Another one ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('or'),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/nhome');
            },
            color: blueColor,
            textColor: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                'Go Back Home!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
