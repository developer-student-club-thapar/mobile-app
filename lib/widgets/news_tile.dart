import 'package:flutter/material.dart';
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
          IconButton(icon:Icon(Icons.launch),
          onPressed: (){
            launcher(data['url']);
          } ,
          )
        ],
        title: Text(
          data['title'],
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}