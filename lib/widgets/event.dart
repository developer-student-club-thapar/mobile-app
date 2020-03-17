import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: kheight(context) * 0.3,
        width: kwidth(context) * 0.75,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: kheight(context) * 0.03,
              child: Container(
                height: kheight(context) * 0.28,
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: kheight(context) * 0.0287),
                      Container(
                        height: kheight(context) * 0.0230,
                        width: kwidth(context) * 0.243,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: yellowColor,
                            shape: BoxShape.rectangle),
                        child: Center(
                          child: Text(
                            'MOBILE DEV',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'AppDev201 Using FLutter',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: kwidth(context) * 0.75,
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry industry industry industry industry',
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          print(kwidth(context));
                        },
                        color: blueColor,
                        textColor: Colors.white,
                        child: Text(
                          'Learn More',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('lib/assets/dsc_logo.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
