import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double kheight(BuildContext context){
  return MediaQuery.of(context).size.height;
}
double kwidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}
TextStyle kMenuTextStyle = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.w300);
TextStyle kMemberCardTitle = GoogleFonts.poppins(
  color:Colors.grey , fontSize: 18 , fontWeight: FontWeight.bold
);