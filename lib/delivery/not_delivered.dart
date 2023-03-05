import 'package:flutter/material.dart';
import 'package:serb_courier/constants/widgets/appbar.dart';

class NotDelivered extends StatelessWidget {
static const String routeName='notDelivery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: PreferredSize(
  child:CustomAppBar(title: 'Delivery',),
  preferredSize: Size.fromHeight(60),
),
    );
  }
}
