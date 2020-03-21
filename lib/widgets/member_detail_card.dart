import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
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
  MemberCard(
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
    return Container(
      height: 270,
      width: 190,
      child: Stack(children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Card(
            elevation: 5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    height: 140,
                    width: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        shape: BoxShape.rectangle),
                    child: Image.network(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        name == null ? 'Loading..' : name,
                        style: kMemberCardTitle,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Text(
                    role == null ? 'Loading' : role,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
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
              decoration: BoxDecoration(
                color: getColor(id == null ? 1 : id),
              ),
            ),
          ),
        )
      ]),
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
