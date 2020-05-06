import 'package:dsc_app/widgets/bottom_tean_row.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'package:dsc_app/models/projects.dart';

class ProjectDetailsPage extends StatefulWidget {
  final ProjectDetail project;

  ProjectDetailsPage(this.project);

  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  List<String> imageLink = [];
  List<String> names = [];
  bool loaded = false;
  void extractImageLinks(List<String> imagelist, List<String> namelist) {
    imagelist.add(widget.project.projectLead.image);
    namelist.add(widget.project.projectLead.name);

    for (int i = 0; i < widget.project.members.length; i++) {
      imagelist.add(widget.project.members[i].image);
    }
    for (int j = 0; j < widget.project.members.length; j++) {
      namelist.add(widget.project.members[j].name);
    }
  }

  void gettingData() async {
    await Future.delayed(Duration(seconds: 2));
    loaded = !loaded;
    setState(() {});
  }

  @override
  initState() {
    extractImageLinks(imageLink, names);
    super.initState();
    gettingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loaded
            ? SafeArea(
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      floating: true,
                      pinned: true,
                      forceElevated: true,
                      elevation: 5,
                      snap: true,
                      expandedHeight: 250,
                      leading: Container(),
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Image.network(
                          widget.project.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Center(
                              child: Text(widget.project.name,
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  runSpacing: 15.0,
                                  children: <Widget>[
                                    Text(
                                      widget.project.description,
                                      textAlign: TextAlign.justify,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Members :',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: kwidth(context),
                                  height: 110,
                                  child: BottomRow(
                                    imageUrl: imageLink,
                                    totalPeople: imageLink.length,
                                    name: names,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: kwidth(context),
                            height: kheight(context) * 0.06,
                            child: RaisedButton(
                              onPressed: () async {
                                try {
                                  launch(widget.project.githubLink);
                                } catch (e) {
                                  print(e);
                                }
                              },
                              color: blueColor,
                              //   textColor: Colors.white,
                              child: Text(
                                'Github Link',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}

Random rnd = new Random();
int min = -1, max = 5;
int r = min + rnd.nextInt(max - min);
