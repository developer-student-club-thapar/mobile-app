import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreenItem extends StatefulWidget {
  final String title;
  final Function function;
  final Color color;

  MenuScreenItem(
      {this.title , this.function, this.color});

  @override
  _MenuScreenItemState createState() => _MenuScreenItemState();
}

class _MenuScreenItemState extends State<MenuScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.function,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(widget.title,
              style: GoogleFonts.poppins(
                  color: widget.color,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300)),
        ),
      ),
    );
  }
}


