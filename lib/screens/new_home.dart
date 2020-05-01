import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
            width: kwidth(context),
            height: kheight(context) * 0.35,
            child: SvgPicture.asset('lib/assets/undraw_team_spirit_hrr4.svg')),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Welcome to DSC TIET',
              style: Theme.of(context).textTheme.headline2),
        )),
        Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            HomeCard(
              title: 'Events',
              icon: Icons.calendar_today,
              iconColor: redColor,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: HomeCard(
                title: 'Ideas',
                icon: Icons.confirmation_number,
                iconColor: greenColor,
              ),
            ),
            HomeCard(
              title: 'Score',
              icon: Icons.score,
              iconColor: blueColor,
            ),
            HomeCard(
              title: 'Stories',
              icon: Icons.book,
              iconColor: yellowColor,
            ),
            HomeCard(
              title: 'About Us',
              icon: Icons.info,
              iconColor: redColor,
            ),
            HomeCard(
              title: 'Team',
              icon: Icons.people,
              iconColor: greenColor,
            ),
          ],
        )
      ],
    ));
  }
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  final String title;
  final Color iconColor;
  HomeCard({this.icon, this.onClick, this.title, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: kwidth(context) * 0.28,
        height: kwidth(context) * 0.28,
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: iconColor,
              size: kwidth(context) * 0.2,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
