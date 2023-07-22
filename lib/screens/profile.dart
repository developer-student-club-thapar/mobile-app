import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/database/firestore-user_database.dart';
import 'package:dsc_app/widgets/app_bar.dart';
import 'package:dsc_app/widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dsc_app/models/user.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? _image;
  bool thaparStudent = false;
  Future pickImage() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // setState(() {
    //   _image = image;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final _db = DatabaseService(uid: user.uid);

    return Scaffold(
        appBar: CustomAppBar(
          title: 'MY PROFILE',
          menu: SelectedMenu.Profile,
        ),
        // bottomNavigationBar: Container(
        //   width: kwidth(context),
        //   height: kheight(context) * 0.06,
        //   child: RaisedButton(
        //       color: blueColor,
        //       onPressed: () {},
        //       child: Text(
        //         'Update Profile',
        //         style: Theme.of(context).textTheme.bodyText1,
        //       )),
        // ),
        body: StreamBuilder<UserData>(
            stream: _db.userDataStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Container(child: CircularProgressIndicator()));
              } else if (!snapshot.hasError && snapshot.hasData) {
                UserData _userData = snapshot.data!;

                return SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: kheight(context) * 0.05,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: pickImage,
                            child: Container(
                              height: kheight(context) * 0.15,
                              width: kheight(context) * 0.15,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kheight(context) * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 9.0),
                        child: TextFormField(
                            initialValue: _userData?.name ?? "",
                            decoration: textInputDecoration('Name', context)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 9.0),
                        child: TextFormField(
                            initialValue: _userData?.email ?? "",
                            decoration: textInputDecoration('Email', context)),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 18.0, vertical: 9.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Text(
                      //         'Are You A Thapar Student?',
                      //         style: Theme.of(context).textTheme.subtitle1,
                      //       ),
                      //       Switch(
                      //           value: thaparStudent,
                      //           activeColor: blueColor,
                      //           onChanged: (value) {
                      //             setState(() {
                      //               thaparStudent = value;
                      //             });
                      //           })
                      //     ],
                      //   ),
                      // ),
                      Text(
                          'Events Attended : ${_userData?.eventsAttended?.length ?? ""} ',
                          style: Theme.of(context).textTheme.subtitle1),
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Card(
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         height: kheight(context) * 0.3,
                      //         width: kwidth(context) * 0.8,
                      //         child: Column(
                      //           children: <Widget>[
                      //             SizedBox(height: 5),
                      //             Text('Previous Events :',
                      //                 style:
                      //                     Theme.of(context).textTheme.headline3,
                      //                 textAlign: TextAlign.left),
                      //             Expanded(
                      //               child: Container(
                      //                 height: kheight(context) * 0.25,
                      //                 child: ListView.builder(
                      //                     padding: EdgeInsets.only(top: 10.0),
                      //                     addAutomaticKeepAlives: true,
                      //                     scrollDirection: Axis.vertical,
                      //                     itemCount:
                      //                         _userData.eventsAttended.length,
                      //                     itemBuilder:
                      //                         (BuildContext context, int index) {
                      //                       return Text(
                      //                         _userData.eventsAttended[index],
                      //                         textAlign: TextAlign.center,
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .headline5,
                      //                       );
                      //                     }),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
                );

                // appBar: CustomAppBar(
                //   title: 'PROFILE',
                //   menu: SelectedMenu.Profile,
                // ),
                // body: SafeArea(
                //   child: Column(
                //     children: <Widget>[
                //       Container(
                //         height: kheight(context),
                //         color: Theme.of(context).scaffoldBackgroundColor,
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //           color: Theme.of(context).cardColor,
                //         ),
                //         height: kheight(context) * 0.28,
                //       ),
                //       Positioned(
                //         top: 75,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Theme.of(context).scaffoldBackgroundColor,
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(30),
                //                 topRight: Radius.circular(30)),
                //           ),
                //         ),
                //         width: kwidth(context),
                //         height: kheight(context) * 0.7,
                //       ),
                // Positioned(
                //   left: (kwidth(context) * 0.5) - 65,
                //   top: 20.0,

                //   height: 130,
                //   width: 130,
                // )
                //     ],
                //   ),
                // ),
              }
              return NoInternet();
            }));
  }
}
