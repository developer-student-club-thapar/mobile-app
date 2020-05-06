import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomRow extends StatelessWidget {
  final List<String> imageUrl;
  final int totalPeople;
  final List<String> name;
  BottomRow({this.imageUrl, this.totalPeople, this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: kwidth(context),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: totalPeople,
          itemBuilder: (BuildContext context, int index) {
            return ImageCircle(
              image: imageUrl[index],
              name: name[index],
            );
          },
        ),
      ),
    );
  }
}

class ImageCircle extends StatelessWidget {
  final String image;
  final String name;
  ImageCircle({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              name,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
