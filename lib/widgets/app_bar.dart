import 'package:dsc_app/screens/menu_screen.dart';
import 'package:dsc_app/widgets/screen_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('lib/assets/dsc_logo.png'),
              height: MediaQuery.of(context).size.height * 0.0345394736830744,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'DSC TIET',
              style: GoogleFonts.poppins(fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, ScaleRoute(page: MenuScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('lib/assets/menu_icon.png'),
                height: MediaQuery.of(context).size.height * 0.0345394736830744,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
