import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double kheight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double kwidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

TextStyle kMenuTextStyle = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.w300);
TextStyle kMemberCardTitle = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold);

Color redColor = Color.fromRGBO(219, 68, 55, 1);
Color blueColor = Color.fromRGBO(66, 133, 244, 1);
Color yellowColor = Color.fromRGBO(244, 180, 0, 1);
Color greenColor = Color.fromRGBO(15, 157, 88, 1);