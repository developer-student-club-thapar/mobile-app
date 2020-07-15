
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/team_tile.dart';

class TeamList extends StatefulWidget {
  final List membersList;
  final String department;
  TeamList({this.membersList , this.department});

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
            teamMemberDetail: widget.membersList[i],
            department: widget.department,
          );
        });
  }
}
