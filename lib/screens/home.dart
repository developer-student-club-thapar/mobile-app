import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dsc_app/models/events.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Event _event;
  EventDetail _eventDetail;
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

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          CustomAppBar(),
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
                          onClick: () {},
                        );
                      }),
                ),
        ],
      )),
    );
  }
}
