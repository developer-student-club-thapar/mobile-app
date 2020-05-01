import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/database/firestore-user_database.dart';
import 'package:dsc_app/networking/auth.dart';
import 'package:dsc_app/screens/login.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dsc_app/models/events.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/news.dart';
import 'package:dsc_app/widgets/news_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Event _event;
  EventDetail _eventDetail;
  String name = 'name';

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
    AuthService _auth = AuthService();
    final user = Provider.of<User>(context);
    final db = DatabaseService(uid: user.uid);
    return StreamBuilder<UserData>(
        stream: db.userDataStream,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      'Greetings ${_userData.name} !' ?? 'Greetings!',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: blueColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                  _event == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.grey[300],
                                endIndent: 20,
                                indent: 20.0,
                                thickness: 5,
                              ),
                              CarouselSlider.builder(
                                  height: kheight(context) * 0.31,
                                  itemCount: _event.detailedEvent.length,
                                  enableInfiniteScroll: false,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    _eventDetail =
                                        _event.detailedEvent[index];
                                    return Events(
                                      title: _eventDetail.title,
                                      topic: _eventDetail.topics[0].name,
                                      content: _eventDetail.info,
                                      onClick: () async {
                                        await _auth.signOut();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                          return Login();
                                        }), ModalRoute.withName('/'));
                                      },
                                    );
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.grey[300],
                                endIndent: 20,
                                indent: 20.0,
                                thickness: 5,
                              ),
                            ],
                          ),
                        ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      'Trending',
                      style: GoogleFonts.poppins(
                          fontSize: 33,
                          color: greenColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _newsData == null
                      ? Center(
                          child: Container(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: kwidth(context),
                            height: kheight(context) * 0.4,
                            child: Card(
                              elevation: 5.0,
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return FutureBuilder(
                                      future: newsObj
                                          .getItemData(_newsData[index]),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return ExpansionTile(
                                              title: Text(
                                            'Loading...',
                                            textAlign: TextAlign.center,
                                          ));
                                        } else {
                                          return NewsTile(
                                            snapshot.data,
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
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
