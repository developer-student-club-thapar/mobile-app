import 'package:dsc_app/networking/api.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dsc_app/models/events.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:dsc_app/constants/constants.dart';
import 'dart:math';
import 'event_details.dart';

class AllEvetScreen extends StatefulWidget {
  @override
  _AllEvetScreenState createState() => _AllEvetScreenState();
}

class _AllEvetScreenState extends State<AllEvetScreen> {
  Event _event;
  EventDetail _eventDetail;
  Api api = Api(path: '/events/?format=json');
  getData() async {
    var result = await api.fetchData();
    if (result!=null) {
      _event = Event.fromJson(result);
      setState(() {});
    } else
      _event = null;
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
          title: 'EVENTS',
          menu: SelectedMenu.Events,
        ),
        body: SafeArea(
          child: _event == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: ListView.builder(
                      itemCount: _event.detailedEvent.length,
                      itemBuilder: (BuildContext context, int index) {
                        _eventDetail = _event.detailedEvent[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                enabled: true,
                                // dense: true,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _eventDetail.title,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Date: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: _eventDetail.date,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2)
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Venue: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: _eventDetail.venue,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2)
                                        ]))
                                  ],
                                ),
                                subtitle: Text(_eventDetail.info,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyText2),
                                trailing: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailsPage(_event.detailedEvent[index]),
                                      ),
                                    );
                                  },
                                  color: blueColor,
                                  textColor: Colors.white,
                                  child: Text(
                                    'Learn More',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontSize: 13),
                                  ),
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
