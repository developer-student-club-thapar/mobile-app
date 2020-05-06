import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TeamTile extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  TeamTile({this.image, this.name, this.role});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        elevation: 10.0,
        child: ListTile(
          isThreeLine: true,
          title: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Text(
            role,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          contentPadding: EdgeInsets.all(8),
          leading: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(image),
                maxRadius: constraints.maxHeight / 2,
                minRadius: 20.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
