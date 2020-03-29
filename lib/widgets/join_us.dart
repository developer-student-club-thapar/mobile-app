import 'package:dsc_app/screens/contacts.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dsc_app/constants/constants.dart';

class JoinUs extends StatefulWidget {
  @override
  JoinUsState createState() => JoinUsState();
}

class JoinUsState extends State<JoinUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            //image
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Image(
                  image:
                      AssetImage('lib/assets/undraw_dev_productivity_umsq.png'),
                ),
              ),
            ),
            //Text
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  "At DSC TIET, our aim is to spread awareness and teach. Developers, come together under one roof to create a community which inspires thousands. Join Us!",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF7C6C72),
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            //Twin Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _launchCoD_URL,
                  color: redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    side: BorderSide(color: redColor),
                  ),
                  splashColor: Colors.redAccent[400],
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                  child: Text(
                    "Code of Conduct",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                OutlineButton(
                  onPressed: _launchSlack_URL,
                  borderSide: BorderSide(color: redColor, width: 2),
                  shape: StadiumBorder(),
                  splashColor: Colors.redAccent[400],
                  highlightedBorderColor: redColor,
                  textColor: redColor,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                  child: Text(
                    "Join our Slack!",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            //contact list
            // name, email, message
            MyContactForm(),
          ],
        ),
      ),
    );
  }
}


_launchCoD_URL() async {
  const url =
      'https://drive.google.com/file/d/1WtxlBDqnZUh7Os1pSwjvv0WDiaYljB-e/view';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchSlack_URL() async {
  const url =
      'https://dscthapar-gspatiala.slack.com/join/shared_invite/enQtNzU2MzA2MjcxNzkyLTkwNDRiNWMzYjUzYjNjYjM0M2JhMDgwOTI3MGQwYWU1NzNlNGMxZGVhNzk0MGZiYTI5YzgwZDhiMTk1MjE4M2M';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}