import 'package:dsc_app/models/team.dart';
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/team_tile.dart';
import 'package:dsc_app/constants/constants.dart';

class TeamList extends StatefulWidget {
  final MembersList? membersList;
  final LeadList? leadList;
  final CoLeadList? coLeadList;
  final MemberType? type;
  TeamList(
      {this.membersList, this.coLeadList, this.leadList, required this.type});

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == MemberType.Lead) {
      return ListView.builder(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: widget.leadList?.members.length,
          itemBuilder: (BuildContext context, int i) {
            return TeamTile(
              teamMemberDetail: widget.leadList?.members[i],
            );
          });
    } else if (widget.type == MemberType.CoLead) {
      return ListView.builder(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: widget.coLeadList?.members.length,
          itemBuilder: (BuildContext context, int i) {
            return TeamTile(
              teamMemberDetail: widget.coLeadList?.members[i],
            );
          });
    } else {
      return ListView.builder(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: widget.membersList?.members.length,
          itemBuilder: (BuildContext context, int i) {
            return TeamTile(
              teamMemberDetail: widget.membersList?.members[i],
            );
          });
    }
  }
}
