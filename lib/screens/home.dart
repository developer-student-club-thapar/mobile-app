import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dsc_app/models/events.dart';
import 'package:dsc_app/screens/event_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsc_app/models/news.dart';
import 'package:dsc_app/widgets/news_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Event _event;
  EventDetail _eventDetail;

  List<dynamic> _newsData;
  News newsObj = News();

  getData() async {
    var response = await http
        .get('https://dsctiet.pythonanywhere.com/api/events/?format=json');
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      _event = Event.fromJson(decodedJson);
      print(_event.detailedEvent.length);
      setState(() {});
    }
  }

  Future<void> updateUI() async {
    _newsData = await newsObj.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    updateUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DSC TIET',
        menu: SelectedMenu.Home,
      ),
      body: SafeArea(
          child: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          _event == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: CarouselSlider.builder(
                      height: kheight(context) * 0.31,
                      itemCount: _event.detailedEvent.length,
                      enableInfiniteScroll: false,
                      itemBuilder: (BuildContext context, int index) {
                        _eventDetail = _event.detailedEvent[index];
                        return Events(
                          title: _eventDetail.title,
                          topic: _eventDetail.topics[0].name,
                          content: _eventDetail.info,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EventDetailsPage(_eventDetail),
                              ),
                            );
                          },
                        );
                      }),
                ),
          Text(
            'Latest Stories',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          ),
          _newsData == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: _newsData.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future: newsObj.getItemData(_newsData[index]),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ExpansionTile(title: Text('Loading...',textAlign: TextAlign.center,));
                        } else {
                          return NewsTile(snapshot.data, newsObj.launchURL);
                        }
                      },
                    );
                  },
                ),
        ],
      )),
    );
  }
}
