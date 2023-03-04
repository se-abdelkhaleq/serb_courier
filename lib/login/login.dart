import 'package:flutter/material.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/custom_button.dart';
import 'package:serb_courier/login_screen/login_screen.dart';

class login extends StatelessWidget {
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/New Project (1).png',
                  fit: BoxFit.cover,
                  width: 1000,
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Serb',
                        style: MyTheme.lightTheme.textTheme.headline2,
                      ),
                      SizedBox(
                        height: 24,
                      ),

                      Center(
                        child: Text(
                          'This app for registered couriers \nTo continue please login to your courier account ',
                          style: MyTheme.lightTheme.textTheme.headline4,
                          overflow: TextOverflow.clip,

                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      CustomButton(
                          text: 'Login',
                          function: () {
                 Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          width: double.infinity)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
