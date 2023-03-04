
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:serb_courier/login/login.dart';



class SplashScreen extends StatefulWidget {

  static const String routeName='splashScreen';
  //static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 0.5,
              width: 200,
              height: 200,
            ),
          ],
        ));
  }
}
