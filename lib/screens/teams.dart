import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/networking/authentication/wrapper.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/member_detail_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/models/team.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

TeamDetails _team;
TeamCategory _teamCategory;

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Meet The Team',
        menu: SelectedMenu.Team,
      ),
      body: TeamCategoryBuilder(),
    );
  }
}

final AsyncMemoizer _memoizer = AsyncMemoizer();
Future getData() async {
  var response = await http
      .get('https://dsctiet.pythonanywhere.com/api/team/?format=json');
  if (response.statusCode == 200) {
    var decodedJson = jsonDecode(response.body);
    _team = TeamDetails.fromJson(decodedJson);

    return _memoizer.runOnce(() async {
      return _team;
    });
  } else
    return 'error';
}

class TeamCategoryBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snapshot) {
          TeamDetails _teamData = snapshot.data;

          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.connectionState == ConnectionState.active &&
              snapshot.connectionState == ConnectionState.waiting &&
              snapshot.connectionState == ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Expanded(
              child: Container(
                child: Image.asset(
                  'lib/assets/undraw_page_not_found_su7k.png',
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              cacheExtent: 1000,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              dragStartBehavior: DragStartBehavior.start,
              itemCount: _teamData.category.length,
              itemBuilder: (BuildContext context, int index) {
                _teamCategory = _teamData.category[index];
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          //Decoration for category title
                          color: getColor(index),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          _teamCategory.name, //Category name
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Head",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      CarouselSlider.builder(
                          // Carousel for building the heads card
                          height: 270,
                          itemCount: _teamCategory.heads.length,
                          enableInfiniteScroll: false,
                          itemBuilder: (BuildContext context, int i) {
                            return MemberCard(
                              name: _teamCategory.heads[i].name,
                              image: _teamCategory.heads[i].image,
                              role: _teamCategory.heads[i].role,
                              id: i,
                              devUrl: _teamCategory.heads[i].devUrl,
                              email: _teamCategory.heads[i].email,
                              githubUrl: _teamCategory.heads[i].githubUrl,
                              linkedinUrl: _teamCategory.heads[i].linkedinUrl,
                              mediumUrl: _teamCategory.heads[i].mediumUrl,
                              twitterUrl: _teamCategory.heads[i].twitterUrl,
                            );
                          }),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Members",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      CarouselSlider.builder(
                          // Carousel for building the members card
                          height: 270,
                          itemCount: _teamData.category[index].members.length,
                          enableInfiniteScroll: false,
                          itemBuilder: (BuildContext context, int j) {
                            return MemberCard(
                              name: _teamCategory.members[j].name,
                              image: _teamCategory.members[j].image,
                              role: _teamCategory.members[j].role,
                              id: j,
                              devUrl: _teamCategory.members[j].devUrl,
                              email: _teamCategory.members[j].email,
                              githubUrl: _teamCategory.members[j].githubUrl,
                              linkedinUrl: _teamCategory.members[j].linkedinUrl,
                              mediumUrl: _teamCategory.members[j].mediumUrl,
                              twitterUrl: _teamCategory.members[j].twitterUrl,
                            );
                          }),
                    ],
                  ),
                );
              },
            );
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}

//Selecting the colour
Color getColor(int selector) {
  switch (selector) {
    case 1:
      {
        return Color.fromRGBO(66, 133, 244, 1);
      }
      break;

    case 2:
      {
        return Color.fromRGBO(219, 68, 55, 1);
      }
      break;
    case 3:
      {
        return Color.fromRGBO(244, 180, 0, 1);
      }
      break;
    case 4:
      {
        return Color.fromRGBO(15, 157, 88, 1);
      }
      break;
    default:
      {
        return Color.fromRGBO(219, 68, 55, 1);
      }
      break;
  }
}
