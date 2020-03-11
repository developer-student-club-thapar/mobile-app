import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 190,
      child: Stack(children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Card(
            elevation: 5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    height: 140,
                    width: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        shape: BoxShape.rectangle),
                    child: Image.asset(
                      'lib/assets/dsc_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Ramyak Mehra', style: kMemberCardTitle)),
                  Text('App Developer'),
                  Row()
                ]),
          ),
        ),
        Positioned(
          left: 15,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 270,
              width: 30,
              decoration: BoxDecoration(color: Color.fromARGB(60, 219, 68, 55)),
            ),
          ),
        )
      ]),
    );
  }
}
