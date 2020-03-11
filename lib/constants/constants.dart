import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double kheight(BuildContext context){
  return MediaQuery.of(context).size.height;
}
double kwidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

TextStyle kMenuTextStyle = GoogleFonts.poppins( color: Colors.blue, fontSize: 10.0, fontWeight: FontWeight.w300);
