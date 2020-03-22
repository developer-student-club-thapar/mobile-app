
import 'package:flutter/material.dart';
import 'package:dsc_app/widgets/app_bar.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: SafeArea(
        child: Container(
          color: Colors.pinkAccent,
        ),
        ),
    );
  }
}
