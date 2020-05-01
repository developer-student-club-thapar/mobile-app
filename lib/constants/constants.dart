import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double kheight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double kwidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

TextStyle kEventTitle = GoogleFonts.poppins(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28);

TextStyle kMenuTextStyle = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.w300);
TextStyle kMemberCardTitle = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold);
TextStyle kDialogueCardTitle = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 28, fontWeight: FontWeight.bold);
TextStyle kTeamDialogueRole =
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w100);

TextStyle kMemberCategryStyle = GoogleFonts.poppins(
    color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.w300);
TextStyle kMemberCategryStyleHeading = GoogleFonts.poppins(
    color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w300);
TextStyle kEventHeading =
    GoogleFonts.poppins(color: Colors.black, fontSize: 28.0);

Color redColor = Color.fromRGBO(219, 68, 55, 1);
Color blueColor = Color.fromRGBO(66, 133, 244, 1);
Color yellowColor = Color.fromRGBO(244, 180, 0, 1);
Color greenColor = Color.fromRGBO(15, 157, 88, 1);

Color getColor(int selector) {
  switch (selector) {
    case 1:
      {
        return Color.fromRGBO(66, 133, 244, 0.7);
      }
      break;

    case 2:
      {
        return Color.fromRGBO(219, 68, 55, 0.7);
      }
      break;
    case 3:
      {
        return Color.fromRGBO(244, 180, 0, 0.7);
      }
      break;
    case 4:
      {
        return Color.fromRGBO(15, 157, 88, 0.7);
      }
      break;
    default:
      {
        return Color.fromRGBO(219, 68, 55, 0.7);
      }
      break;
  }
}

Color getColorButton(int selector) {
  switch (selector) {
    case 1:
      {
        return Color.fromRGBO(66, 133, 244, 1);
      }
      break;

    case 2:
      {
        return Color.fromRGBO(219, 68, 55, 1);
      }
      break;
    case 3:
      {
        return Color.fromRGBO(244, 180, 0, 1);
      }
      break;
    case 4:
      {
        return Color.fromRGBO(15, 157, 88, 1);
      }
      break;
    default:
      {
        return Color.fromRGBO(219, 68, 55, 1);
      }
      break;
  }
}

enum SelectedMenu { Home, ContactUs, Team, Projets, Events, Logout, Profile }

TextStyle KMemberCategryStyle = GoogleFonts.poppins(
    color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.w300);
TextStyle KMemberCategryStyleHeading = GoogleFonts.poppins(
    color: Colors.grey, fontSize: 28.0, fontWeight: FontWeight.w300);
