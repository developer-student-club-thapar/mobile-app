import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'package:dsc_app/models/projects.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectDetail _projectDetail;
  ProjectDetailsPage(this._projectDetail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DSC TIET',
        menu: SelectedMenu.Projets,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    //Decoration for category title
                    color: getColor(r),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    _projectDetail.name,
                    style: kEventTitle,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Wrap(
                              //    direction: Axis.vertical,
                              runSpacing: 15.0,
                              children: <Widget>[
                                Text(
                                  _projectDetail.description,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    //Decoration for category title
                    color: getColor(r + 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Topics Covered:',
                    style: kEventHeading,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      //Decoration for category title
                      color: getColor(r + 2),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Faculty:',
                      style: kEventHeading,
                    ),
                  ),
                  Text(_projectDetail.faculty,
                      style: TextStyle(fontSize: 20.0)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      //Decoration for category title
                      color: getColor(r - 2),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Funding:',
                      style: kEventHeading,
                    ),
                  ),
                  Text(
                    _projectDetail.funding,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    try {
                      launch(_projectDetail.link);
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: getColorButton(r),
                  textColor: Colors.white,
                  child: Text(
                    'Github Link',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    //Decoration for category title
                    color: getColor(r + 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Topics Covered:',
                    style: kEventHeading,
                  ),
                ),
              ),
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Wrap(
                              //    direction: Axis.vertical,
                              runSpacing: 15.0,
                              children: <Widget>[
                                Text(
                                  _projectDetail.extra,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Random rnd = new Random();
int min = -1, max = 5;
int r = min + rnd.nextInt(max - min);
