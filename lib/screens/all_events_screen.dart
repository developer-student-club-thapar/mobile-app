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
  getData() async {
    var response = await http
        .get('https://dsctiet.pythonanywhere.com/api/events/?format=json');
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      _event = Event.fromJson(decodedJson);

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
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText2),
                              trailing: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EventDetailsPage(_eventDetail),
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
                        );
                      }),
                ),
        ));
  }
}

Random rnd = new Random();
int min = -1, max = 5;
int r = min + rnd.nextInt(max - min);
