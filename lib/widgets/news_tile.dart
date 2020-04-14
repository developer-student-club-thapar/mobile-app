import 'package:flutter/material.dart';
import 'package:dsc_app/screens/news_view.dart';

class NewsTile extends StatelessWidget {
  final data;
  final Function launcher;

  NewsTile(this.data, this.launcher);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.launch),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NewsView()));
            },
          )
        ],
        title: Text(
          data['title'],
          style: TextStyle( 
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
