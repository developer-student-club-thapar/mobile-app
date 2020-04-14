import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: Stack(
        children: <Widget>[
          Container(
            height: kheight(context),
            color: Colors.white,
          ),
          Container(
            color: Colors.black,
            height: kheight(context) * 0.28,
          ),
          Positioned(
            top: kheight(context) * 0.25,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Text('Ramyak Mehra',
                      style: GoogleFonts.poppins(
                          fontSize: 23.0, fontWeight: FontWeight.bold)),
                  Text('ramyakmehra10@gmail.com',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontSize: 15.0,
                      )),
                  // Text('10',
                  //     style: GoogleFonts.poppins(
                  //       color: Colors.grey[400],
                  //       fontSize: 15.0,
                  //     )),
                  Text('Events Attended : 10',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontSize: 15.0,
                      ))
                ],
              )),
            ),
            width: kwidth(context),
            height: kheight(context) * 0.7,
          ),
          Positioned(
            left: (kwidth(context) * 0.5) - 65,
            top: (kheight(context) * 0.25) - 65,
            child: Container(color: Colors.blue),
            height: 130,
            width: 130,
          )
        ],
      ),
    );
  }
}
