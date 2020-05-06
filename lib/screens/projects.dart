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
  ProjectDetail projectDetail;
  getData() async {
    var response = await http
        .get('https://dsctiet.pythonanywhere.com/api/projects/?format=json');
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      _project = Project.fromJson(decodedJson);

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
        appBar: CustomAppBar(
          title: 'PROJECTS',
          menu: SelectedMenu.Projets,
        ),
        body: SafeArea(
          child: _project == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: ListView.builder(
                      itemCount: _project.detailedProject.length,
                      itemBuilder: (BuildContext context, int index) {
                        projectDetail = _project.detailedProject[index];
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
                                    projectDetail.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Visibility(
                                    maintainSize: false,
                                    visible: projectDetail.funding != '',
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Faculty: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: projectDetail.faculty ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2)
                                        ])),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: 'Funding: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: projectDetail.funding ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2)
                                      ]))
                                ],
                              ),
                              subtitle: Text(
                                projectDetail.description,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              trailing: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectDetailsPage(_project
                                                  .detailedProject[index])));
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
