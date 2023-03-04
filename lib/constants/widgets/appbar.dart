import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


class CustomAppBar extends StatelessWidget {
String title;
CustomAppBar({required this.title,});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Text(
       title,
          style: GoogleFonts.openSans(fontSize: 16),
        ),
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      systemOverlayStyle:
      SystemUiOverlayStyle(statusBarColor: HexColor('#63ade1')),
      backgroundColor: HexColor('#63ade1'),
    );
  }
}
