import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/database/firestore-user_database.dart';
import 'package:dsc_app/networking/auth.dart';
import 'package:dsc_app/screens/login.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dsc_app/models/events.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Event _event;
  EventDetail _eventDetail;
  String name = 'name';
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
    AuthService _auth = AuthService();
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData _userData = snapshot.data;
            return Scaffold(
              appBar: CustomAppBar(
                title: 'DSC TIET',
                menu: SelectedMenu.Home,
              ),
              body: SafeArea(
                  child: ListView(
                children: <Widget>[
                  Text(
                    'Greetings ${_userData.name} !',
                    style: TextStyle(fontSize: 28, color: Colors.grey),
                  ),
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
                                  onClick: () async {
                                    _auth.signOut();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }), ModalRoute.withName('/'));
                                  },
                                );
                              }),
                        ),
                  SizedBox(height: 20.0),
                ],
              )),
            );
          } else {
            return Container();
          }
        });
  }
}
