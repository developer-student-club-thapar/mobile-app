import 'package:flutter/material.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:flare_flutter/flare_actor.dart';

class MenuScreen extends StatelessWidget {
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
            
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('HOME', style: kMenuTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('EVENTS', style: kMenuTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('PROJECTS', style: kMenuTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('TEAM', style: kMenuTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
