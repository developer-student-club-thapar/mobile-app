import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  final SelectedMenu menu;

  CustomAppBar({@required this.title, this.menu})
      : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: menu != SelectedMenu.Home
                  ? () {
                      Navigator.popAndPushNamed(context, '/nhome');
                    }
                  : () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('lib/assets/dsc_logo.png'),
                    height:
                        MediaQuery.of(context).size.height * 0.0345394736830744,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuScreen(
                              selectedMenu: menu,
                            )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Image(
                  image: AssetImage('lib/assets/menu_icon.png'),
                  height:
                      MediaQuery.of(context).size.height * 0.0345394736830744,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
