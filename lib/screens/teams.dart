import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/no_internet.dart';
import 'package:dsc_app/widgets/team_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/models/team.dart';
import 'package:dsc_app/networking/api.dart';
import 'package:provider/provider.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  Api apiMembers = Api(path: '/members/?format=json');
  Api apiLeads = Api(path: '/leads/?format=json');
  Api apiCoLeads = Api(path: '/co-leads/?format=json');

  Future<LeadList?> getLeads() async {
    var result = await apiLeads.fetchData();
    if (result != null) {
      LeadList _leadList = LeadList.fromJson(result);
      return _leadList;
    }
    return null;
  }

  Future<CoLeadList?> getCoLeads() async {
    var result = await apiCoLeads.fetchData();
    if (result != null) {
      CoLeadList _coLeadList = CoLeadList.fromJson(result);
      return _coLeadList;
    }
    return null;
  }

  Future<MembersList?> getCore() async {
    var result = await apiMembers.fetchData();
    if (result != null) {
      MembersList _membersList = MembersList.fromJson(result);
      return _membersList;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final internet = Provider.of<DataConnectionStatus>(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Meet The Team',
          menu: SelectedMenu.Team,
        ),
        body: internet == DataConnectionStatus.connected
            ? ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 16),
                      child: Text(
                        "Leads",
                        style: GoogleFonts.poppins(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 23),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getLeads(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasError == false &&
                            snapshot.data != null &&
                            snapshot.hasData) {
                          return createLeads(context, snapshot);
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Container(
                                  child: CircularProgressIndicator()));
                        }
                        return NoInternet();
                      }),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 16),
                      child: Text(
                        "Co-Leads",
                        style: GoogleFonts.poppins(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 23),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getCoLeads(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasError == false &&
                            snapshot.data != null &&
                            snapshot.hasData) {
                          return createCoLeads(context, snapshot);
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Container(
                                  child: CircularProgressIndicator()));
                        }
                        return NoInternet();
                      }),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 16),
                      child: Text(
                        "Core",
                        style: GoogleFonts.poppins(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 23),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getCore(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasError == false &&
                            snapshot.data != null &&
                            snapshot.hasData) {
                          return createMembers(context, snapshot);
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Container(
                                  child: CircularProgressIndicator()));
                        }
                        return NoInternet();
                      }),
                ],
              )
            : NoInternet());
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

Widget createMembers(BuildContext context, AsyncSnapshot snapshot) {
  MembersList _membersList = snapshot.data;
  return TeamList(
    membersList: _membersList,
    type: MemberType.Core,
  );
}

Widget createLeads(BuildContext context, AsyncSnapshot snapshot) {
  LeadList _leadList = snapshot.data;
  return TeamList(
    leadList: _leadList,
    type: MemberType.Lead,
  );
}

Widget createCoLeads(BuildContext context, AsyncSnapshot snapshot) {
  CoLeadList _coLeadList = snapshot.data;
  return TeamList(coLeadList: _coLeadList, type: MemberType.CoLead);
}
