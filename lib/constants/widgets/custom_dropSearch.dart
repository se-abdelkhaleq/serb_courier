import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomdropSearch extends StatelessWidget {
  String hintText;
  List<String>items;
  CustomdropSearch({required this .hintText,required this.items});
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.dialog(
        fit: FlexFit.loose,
        //showSearchBox: true,
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items:items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          //  labelText: "Egypt",
          hintText: hintText,
        ),
      ),
    );
  }
}
