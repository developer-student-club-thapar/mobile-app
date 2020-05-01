import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomClickableIcon extends StatelessWidget {
  final String url;
  final IconData icon;
  final bool visibility;
  CustomClickableIcon({this.icon, this.url, this.visibility});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Visibility(
        maintainSize: false,
        visible: visibility,
        child: GestureDetector(
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: FaIcon(
            icon,
            color: IconThemeData().color,
            size: IconThemeData().size,
          ),
        ),
      ),
    );
  }
}
