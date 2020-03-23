import 'package:dsc_app/constants/constants.dart';
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
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: TeamCategoryBuilder(),
    );
  }
}

class TeamCategoryBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snapshot) {
          TeamDetails _teamData = snapshot.data;

          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container();
          }
          if (snapshot.hasData) {
            return ListView.builder( 
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                dragStartBehavior: DragStartBehavior.start,
                itemCount: _team.category.length,
                itemBuilder: (BuildContext context, int index) {
                  TeamCategory _teamCategory = _teamData.category[index];
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                          child: Text("Meet the team",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration( //Decoration for category title
                            color: getColor(index),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            _teamCategory.name, //Category name
                            style: KMemberCategryStyle,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Head",
                          style: KMemberCategryStyleHeading,
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
                              );
                            }),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Members",
                          style: KMemberCategryStyleHeading,
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
                              );
                            }),
                      ],
                    ),
                  );
                },  
              );
          } else
            return Center(
                child: Container(
              child:
                  CircularProgressIndicator(), //incase the data is not available
            ));
        });
  }
}

//Gettting the data from api
Future<TeamDetails> getData() async {
  var response = await http
      .get('https://dsctiet.pythonanywhere.com/api/team/?format=json');

  var decodedJson = jsonDecode(response.body);
  _team = TeamDetails.fromJson(decodedJson);
  print('got data');
  return _team;
}

//Selecting the colour
Color getColor(int selector) {
  switch (selector) {
    case 1:
      {
        return Color.fromRGBO(66, 133, 244, 0.7);
      }
      break;

    case 2:
      {
        return Color.fromRGBO(219, 68, 55, 0.7);
      }
      break;
    case 3:
      {
        return Color.fromRGBO(244, 180, 0, 0.7);
      }
      break;
    case 4:
      {
        return Color.fromRGBO(15, 157, 88, 0.7);
      }
      break;
    default:
      {
        return Color.fromRGBO(219, 68, 55, 0.7);
      }
      break;
  }
}
