import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/database/firestore-user_database.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final _db = DatabaseService(uid: user.uid);
    return StreamBuilder<UserData>(
        stream: _db.userDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData _userData = snapshot.data;
            return Scaffold(
              appBar: CustomAppBar(
                title: 'PROFILE',
                menu: SelectedMenu.Profile,
              ),
              body: Stack(
                children: <Widget>[
                  Container(
                    height: kheight(context),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/google_profile.png',
                            ),
                            fit: BoxFit.fitWidth)),
                    height: kheight(context) * 0.28,
                  ),
                  Positioned(
                    top: kheight(context) * 0.25,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: SingleChildScrollView(
                            child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: kheight(context) * 0.1,
                              ),
                              Text(_userData.name,
                                  style: Theme.of(context).textTheme.headline3),
                              Text(_userData.email,
                                  style: Theme.of(context).textTheme.headline6),

                              Text(
                                  'Events Attended : ${_userData.eventsAttended.length}',
                                  style: Theme.of(context).textTheme.headline6),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: blueColor, width: 2),
                                            right: BorderSide(
                                                color: yellowColor, width: 2),
                                            bottom: BorderSide(
                                                color: redColor, width: 2),
                                            left: BorderSide(
                                                color: greenColor, width: 2))),
                                    height: kheight(context) * 0.3,
                                    width: kwidth(context) * 0.8,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 5),
                                        Text('Previous Events :',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                            textAlign: TextAlign.left),
                                        Expanded(
                                          child: Container(
                                            height: kheight(context) * 0.25,
                                            child: ListView.builder(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                addAutomaticKeepAlives: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: _userData
                                                    .eventsAttended.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Text(
                                                    _userData
                                                        .eventsAttended[index],
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  );
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   child: RaisedButton(
                              //       color: blueColor,
                              //       onPressed: () {},
                              //       child: Text(
                              //         'Update Profile',
                              //         style: GoogleFonts.poppins(
                              //             color: Colors.white),
                              //       )),
                              // )
                            ],
                          ),
                        )),
                      ),
                    ),
                    width: kwidth(context),
                    height: kheight(context) * 0.7,
                  ),
                  Positioned(
                    left: (kwidth(context) * 0.5) - 65,
                    top: (kheight(context) * 0.25) - 65,
                    child: GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: _image == null
                                    ? NetworkImage(user.image)
                                    : FileImage(_image),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    height: 130,
                    width: 130,
                  )
                ],
              ),
            );
          } else
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
        });
  }
}
