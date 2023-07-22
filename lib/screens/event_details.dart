// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/events.dart';
import 'package:dsc_app/widgets/app_bar.dart';

class EventDetailsPage extends StatelessWidget {
  final EventDetail eventDetail;
  EventDetailsPage({required this.eventDetail});
  List<Chip> _topics = [];
  @override
  Widget build(BuildContext context) {
    int i = 0;
    _topics = eventDetail.topics.map((e) {
      i++;
      return Chip(
        backgroundColor: getColorButton(i % 4),
        shadowColor: redColor,
        label: Text(
          e.name ?? '',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      );
    }).toList();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: kheight(context) / 3,
                        child: CachedNetworkImage(
                          imageUrl: eventDetail.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: kheight(context) * 0.28,
                        bottom: kheight(context) * 0.08,
                      ),
                      child: Card(
                        elevation: 5.0,
                        margin: EdgeInsets.zero,
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ListView(
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      //Decoration for category title
                                      // color: getColor(r),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      eventDetail.title ?? '',
                                      style: kEventTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Date: ${eventDetail.date}',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Time: ${eventDetail.time}',
                                              style: TextStyle(fontSize: 20.0)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Venue:',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text(
                                            eventDetail.venue ?? '',
                                            style: TextStyle(fontSize: 20.0),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color: Color.fromRGBO(217, 217, 217, 0.1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                'Details',
                                                style: kEventHeading.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0)
                                                  .copyWith(top: 0),
                                              child: Center(
                                                child: Wrap(
                                                  //    direction: Axis.vertical,
                                                  runSpacing: 15.0,
                                                  children: <Widget>[
                                                    Text(
                                                      eventDetail.info ?? '',
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                  ],
                                                ),
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
                                      // color: getColor(r + 1),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Topics Covered:',
                                      style: kEventHeading.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: _topics,
                                      alignment: WrapAlignment.start,
                                      spacing: 8,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        try {
                                          launch(eventDetail.docs ?? '');
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                      child: Text(
                                        'Learn More!',
                                        textAlign: TextAlign.center,
                                        style:
                                            GoogleFonts.poppins(fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  try {
                    launch(eventDetail.link ?? '');
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: kwidth(context),
                  height: kheight(context) * 0.08,
                  color: getColorButton(r + 1),
                  child: Text(
                    'Register!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Random rnd = new Random();
int min = -1, max = 5;
int r = min + rnd.nextInt(max - min);
