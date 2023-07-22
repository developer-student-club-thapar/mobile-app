import 'dart:math';

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dsc_app/networking/api.dart';
import 'package:dsc_app/widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/models/projects.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/screens/project_details.dart';
import 'package:provider/provider.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Project? _project;
  ProjectDetail? projectDetail;
  Api api = Api(path: '/projects/?format=json');
  Future<Project?> getData() async {
    var result = await api.fetchData();
    if (result != null) {
      return Project.fromJson(result);
    }
    return null;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final internet = Provider.of<DataConnectionStatus>(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: 'PROJECTS',
          menu: SelectedMenu.Projets,
        ),
        body: internet == DataConnectionStatus.connected
            ? FutureBuilder(
                future: getData(),
                builder: (context, projectSnapt) {
                  if (projectSnapt.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (projectSnapt.connectionState ==
                          ConnectionState.done &&
                      projectSnapt.hasError == false) {
                    return SafeArea(
                      child: Center(
                        child: ListView.builder(
                            itemCount: _project?.detailedProject.length,
                            itemBuilder: (BuildContext context, int index) {
                              projectDetail = _project?.detailedProject[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: ListTile(
                                    enabled: true,
                                    // dense: true,
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          projectDetail?.name ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Visibility(
                                          maintainSize: false,
                                          visible: projectDetail?.funding != '',
                                          child: RichText(
                                              text: TextSpan(
                                                  text: 'Faculty: ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: projectDetail
                                                            ?.faculty ??
                                                        '',
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
                                                  text:
                                                      projectDetail?.funding ??
                                                          '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2)
                                            ]))
                                      ],
                                    ),
                                    subtitle: Text(
                                      projectDetail?.description ?? '',
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProjectDetailsPage(_project
                                                            ?.detailedProject[
                                                        index])));
                                      },
                                      child: Text(
                                        'Learn More',
                                        textAlign: TextAlign.center,
                                        style:
                                            GoogleFonts.poppins(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  }
                  return NoInternet();
                },
              )
            : NoInternet());
  }
}

Random rnd = new Random();
int min = -1, max = 5;
int r = min + rnd.nextInt(max - min);
