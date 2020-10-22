import 'package:dsc_app/models/team.dart';
import 'package:dsc_app/screens/team_member_detial.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TeamTile extends StatelessWidget {
  final Members teamMemberDetail;

  TeamTile({this.teamMemberDetail});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TeamMemberDetails(
                        member: teamMemberDetail,
                      )));
        },
        child: Card(
          elevation: 10.0,
          child: ListTile(
            isThreeLine: true,
            title: Text(
              teamMemberDetail.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              teamMemberDetail.role,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            contentPadding: EdgeInsets.all(8),
            leading: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(teamMemberDetail.image),
                  maxRadius: constraints.maxHeight / 2,
                  minRadius: 20.0,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
