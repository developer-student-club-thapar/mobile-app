import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/team_tile.dart';

class TeamList extends StatefulWidget {
  final List membersList;
  TeamList({this.membersList});

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        // Carousel for building the heads card
        shrinkWrap: true,
        itemCount: widget.membersList.length,
        itemBuilder: (BuildContext context, int i) {
          return TeamTile(
            name: widget.membersList[i].name,
            image: widget.membersList[i].image,
            role: widget.membersList[i].role,
          );
        });
  }
}
