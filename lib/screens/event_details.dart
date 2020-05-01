import 'package:dsc_app/models/events.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class EventDetailsPage extends StatelessWidget {
  final EventDetail _eventDetail;
  EventDetailsPage(this._eventDetail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'EVENT',
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
                    _eventDetail.title,
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
                                  _eventDetail.info,
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
                height: 20.0,
              ),
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _eventDetail.topics.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: Text(
                            _eventDetail.topics[index].name,
                            style: TextStyle(fontSize: 20.0),
                          ));
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                      'Date:',
                      style: kEventHeading,
                    ),
                  ),
                  Text(_eventDetail.date, style: TextStyle(fontSize: 20.0)),
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
                      'Venue:',
                      style: kEventHeading,
                    ),
                  ),
                  Text(
                    _eventDetail.venue,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      try {
                        launch(_eventDetail.link);
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: getColorButton(r),
                    textColor: Colors.white,
                    child: Text(
                      'Register!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  try {
                    launch(_eventDetail.docs);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Center(
                    child: Text(
                  'Click here to learn more.',
                  style: TextStyle(fontSize: 20, color: Color(0xffb0000FF)),
                )),
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
