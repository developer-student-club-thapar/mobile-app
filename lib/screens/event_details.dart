import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EventDetails extends StatelessWidget {
  final Color bgcolor = Color.fromARGB(1000, 3, 19, 39);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
              child: Container(
          
          height: 60.0,
          width: kwidth(context),
          child: RaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.event_available , color: Colors.white, size: 45.0,),
              
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text('Going' , style: kMenuTextStyle,),
                )
              ],
            ),
            onPressed: () {
              print('goinf');
            },
            color: bgcolor,
          ),
        ),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: bgcolor,
            floating: true,
            pinned: true,
            forceElevated: true,
            elevation: 5,
            title: Center(
              child: Text(
                'Flutter Workshop',
                style: kMenuTextStyle,
              ),
            ),
            snap: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(
                'lib/assets/cean.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 15),
                      child: Text('Applifpppefpef', style: kMenuTextStyle),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Container(
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: bgcolor,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'India',
                                      style: TextStyle(color: bgcolor),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      color: bgcolor,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Thu , Feb 19',
                                      style: TextStyle(color: bgcolor),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: bgcolor,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      '43 View',
                                      style: TextStyle(color: bgcolor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(fontSize: 23.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
