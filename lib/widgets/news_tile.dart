import 'package:flutter/material.dart';
import 'package:dsc_app/screens/news_view.dart';

class NewsTile extends StatelessWidget {
  final data;

  NewsTile(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.launch),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => NewsView(
                            url: data['url'],
                          )));
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
