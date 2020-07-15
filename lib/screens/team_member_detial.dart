import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamMemberDetails extends StatelessWidget {
  final  member;
  final String department;
  TeamMemberDetails({this.member, this.department});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'TEAM MEMBER',
        menu: SelectedMenu.Team,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: kwidth(context),
            height: kheight(context) * 0.5,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 50,
                  child: Container(
                    width: kwidth(context),
                    height: kheight(context) * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              member.name,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              member.email,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                teamColumn('Role', member.role, context),
                                teamColumn('Department', department, context),
                              ],
                            ),
                            SizedBox(
                              height: kheight(context) * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 15, right: 15),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CustomClickableIcon(
                                      url: member.linkedinUrl ?? '',
                                      icon: FontAwesomeIcons.linkedin,
                                      visibility: true ?? false,
                                    ),
                                    CustomClickableIcon(
                                      url: member.githubUrl ?? '',
                                      icon: FontAwesomeIcons.githubSquare,
                                      visibility: true ?? false,
                                    ),
                                    CustomClickableIcon(
                                      url: member.mediumUrl ?? '',
                                      icon: FontAwesomeIcons.medium,
                                      visibility: true ?? false,
                                    ),
                                    CustomClickableIcon(
                                      url: member.twitterUrl ?? '',
                                      icon: FontAwesomeIcons.twitter,
                                      visibility: true ?? false,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

Widget teamColumn(String title, String value, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.headline4,
      )
    ],
  );
}
