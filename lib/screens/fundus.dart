import 'package:dsc_app/constants/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DSC TIET',
        menu: SelectedMenu.ContactUs,
      ),
      body: MyContactForm(),
    );
  }
}

class MyContactForm extends StatefulWidget {
  @override
  _MyContactFormState createState() => _MyContactFormState();
}

class _MyContactFormState extends State<MyContactForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              "Contact Us At Discord",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () async {
                  const url = "https://discord.gg/z4V5bMB";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {}
                },
                child: Card(
                  child: Image.asset('lib/assets/discord.png'),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: FlareActor(
            'lib/assets/contactInputanime.flr',
            animation: "walking",
            alignment: Alignment.bottomCenter,
          ),
        ),
      ],
    );
  }
}
