import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/custom_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamDialogue extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String githubUrl;
  final String linkedinUrl;
  final String twitterUrl;
  final String mediumUrl;
  final String devUrl;
  final String image;
  final int id;

  TeamDialogue(
      {this.name,
      this.devUrl,
      this.email,
      this.githubUrl,
      this.image,
      this.linkedinUrl,
      this.mediumUrl,
      this.role,
      this.id,
      this.twitterUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: kheight(context) * 0.66,
        width: kwidth(context) * 0.88,
        child: Stack(children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Card(
              elevation: 5,
              child: ListView(children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          height: 297,
                          width: 209,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              shape: BoxShape.rectangle),
                          child: Image.network(
                            image ??
                                'https://dsctiet.pythonanywhere.com/media/profile-images/IMG_20200209_124126.jpg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              name == null ? 'Loading..' : name,
                              style: kDialogueCardTitle,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Text(
                          role == null ? 'Loading' : role,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: kTeamDialogueRole,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CustomClickableIcon(
                              url: linkedinUrl,
                              icon: FontAwesomeIcons.linkedin,
                              visibility: true ?? false,
                            ),
                            CustomClickableIcon(
                              url: githubUrl,
                              icon: FontAwesomeIcons.githubSquare,
                              visibility: true ?? false,
                            ),
                            CustomClickableIcon(
                              url: mediumUrl,
                              icon: FontAwesomeIcons.medium,
                              visibility: true ?? false,
                            ),
                            CustomClickableIcon(
                              url: twitterUrl,
                              icon: FontAwesomeIcons.twitter,
                              visibility: true ?? false,
                            ),
                            CustomClickableIcon(
                              url: 'mailto:$email',
                              icon: FontAwesomeIcons.envelope,
                              visibility: true ?? false,
                            ),
                          ],
                        )
                      ]),
                ),
              ]),
            ),
          ),
          Positioned(
            left: 25,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: kheight(context) * 0.66,
                width: 40,
                decoration: BoxDecoration(
                  color: getColor(id == null ? 1 : id),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

Color getColor(int selector) {
  switch (selector % 7) {
    case 0:
      {
        return Color.fromRGBO(66, 133, 244, 0.5);
      }
      break;

    case 1:
      {
        return Color.fromRGBO(219, 68, 55, 0.5);
      }
      break;
    case 2:
      {
        return Color.fromRGBO(244, 180, 0, 0.5);
      }
      break;
    case 3:
      {
        return Color.fromRGBO(15, 157, 88, 0.5);
      }
      break;
    default:
      {
        return Color.fromRGBO(219, 68, 55, 0.5);
      }
      break;
  }
}
