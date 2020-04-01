import 'package:flutter/material.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:dsc_app/widgets/menu_item.dart';

class MenuScreen extends StatefulWidget {
   SelectedMenu selectedMenu;
  MenuScreen({this.selectedMenu});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              height: 200.0,
              child: FlareActor(
                'lib/assets/Menu.flr',
                animation: "loopWaving",
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Home;
                });
                Navigator.pushNamed(context, '/home');
              },
              title: 'HOME',
              color:
                  widget.selectedMenu == SelectedMenu.Home ? Colors.white : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Events;
                });
                Navigator.pushNamed(context, '/events');
              },
              title: 'EVENTS',
              color: widget.selectedMenu == SelectedMenu.Events
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Projets;
                });
                Navigator.pushNamed(context, '/projects');
              },
              title: 'PROJECTS',
              color: widget.selectedMenu == SelectedMenu.Projets
                  ? Colors.white
                  : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.Team;
                });
                Navigator.pushNamed(context, '/team');
              },
              title: 'TEAM',
              color:
                  widget.selectedMenu == SelectedMenu.Team ? Colors.white : Colors.grey,
            ),
            MenuScreenItem(
              function: () {
                setState(() {
                  widget.selectedMenu = SelectedMenu.ContactUs;
                });
                Navigator.pushNamed(context, '/contactus');
              },
              title: 'CONTACT US',
              color: widget.selectedMenu == SelectedMenu.ContactUs
                  ? Colors.white
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
