import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/team_list.dart';
import 'package:dsc_app/widgets/team_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/models/team.dart';
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
      appBar: CustomAppBar(
        title: 'Meet The Team',
        menu: SelectedMenu.Team,
      ),
      body: TeamCategoryBuilder(),
    );
  }
}

Future getData() async {
  var response = await http
      .get('https://dsctiet.pythonanywhere.com/api/team/?format=json');
  if (response.statusCode == 200) {
    var decodedJson = jsonDecode(response.body);
    _team = TeamDetails.fromJson(decodedJson);
    return _team;
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
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
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
                      Text(
                        _teamCategory.name, //Category name
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 16),
                          child: Text(
                            "Head",
                            style: GoogleFonts.poppins(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                fontSize: 23),
                          ),
                        ),
                      ),
                      TeamList(
                        membersList: _teamCategory.heads,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 16),
                          child: Text(
                            "Members",
                            style: GoogleFonts.poppins(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                fontSize: 23),
                          ),
                        ),
                      ),
                      TeamList(
                        membersList: _teamCategory.members,
                      ),
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
