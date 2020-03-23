import 'package:dsc_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ProjectDetail extends StatefulWidget {
  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'DSC TIET'),
      body: Container(
        child: Column(
           
        ),
      ),
    );
  }
}
