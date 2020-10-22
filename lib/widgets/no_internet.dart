import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Please Check Your Internet Connection",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: FlareActor(
              'lib/assets/nointernet.flr',
              animation: "NoInternet",
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
