import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/models/projects.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/screens/project_details.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Project _project;
  ProjectDetail _projectDetail;
  getData() async {
    var response = await http
        .get('https://dsctiet.pythonanywhere.com/api/projects/?format=json');
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      _project = Project.fromJson(decodedJson);
      print(_project.detailedProject.length);
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'DSC TITLE'),
        body: SafeArea(
          child: _project == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: ListView.builder(
                      itemCount: _project.detailedProject.length,
                      itemBuilder: (BuildContext context, int index) {
                        _projectDetail = _project.detailedProject[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              enabled: true,
                              // dense: true,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _projectDetail.name ?? '',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Visibility(
                                    maintainSize: false,
                                    visible: _projectDetail.funding != '',
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Faculty: ',
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  _projectDetail.faculty ?? '',
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ])),
                                  ),
                                  Visibility(
                                    maintainSize: false,
                                    visible: _projectDetail.funding != '',
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Funding: ',
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  _projectDetail.funding ?? '',
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ])),
                                  )
                                ],
                              ),
                              subtitle: Text(
                                _projectDetail.description,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProjectDetailsPage(_projectDetail),
                                    ),
                                  );
                                },
                                color: getColorButton(r),
                                textColor: Colors.white,
                                child: Text(
                                  'Learn More',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ));
  }
}

Random rnd = new Random();
int min = -1, max = 5;
int r = min + rnd.nextInt(max - min);
