import 'package:flutter/material.dart';
import 'package:serb_courier/constants/constants.dart';
import 'package:serb_courier/delivery/not_delivered.dart';
import 'package:serb_courier/login_screen/login_screen.dart';

class CustomDropDown extends StatefulWidget {
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _selectedGender;
  List<String> items =  [
    'delivered',
    'not been delivered',
    'Shipment rejected',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: DropdownButtonHideUnderline(

        child: DropdownButton(

          iconEnabledColor: darkblue,

          iconSize: 35,
          isExpanded: true,
          value: _selectedGender,
          items: items
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,

              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          onChanged: (value){
            setState(() {
              _selectedGender=value;

            });
            switch(value){
              case "not been delivered" :
          Navigator.pushNamed(context, NotDelivered.routeName);

            }

          },
          hint: Text('delivered'),



        ),
      ),
    );

}

}

