
import 'package:flutter/material.dart';
import 'package:serb_courier/constants/constants.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback function;
  double width;
  CustomButton({required this.text, required this.function,required this.width});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(12)),
          backgroundColor: lightblue,
        minimumSize: Size(width, 40)
        ),
        onPressed: function, child: Text(text,style: TextStyle(color: Colors.white),));
  }
}
