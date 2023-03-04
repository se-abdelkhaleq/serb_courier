import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  TextEditingController controller;
  String hint;
  TextInputType? keyboardType;
  String label;
  Widget ?suffixIcon ;
  CustomTextForm(
    {this.keyboardType=TextInputType.number,
    required this.controller,
    required this.hint,
      required this.label,
       this.suffixIcon
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(label),
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            ))),
      ),
    );
  }
}
