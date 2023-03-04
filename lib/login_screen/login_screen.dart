import 'package:flutter/material.dart';
import 'package:serb_courier/Home%20Screen/home_screen.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/custom_button.dart';
import 'package:serb_courier/constants/widgets/custom_text_form.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'loginScreen';
  TextEditingController idController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome back',
              style: MyTheme.lightTheme.textTheme.headline2,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "You 've been missed",
              style: MyTheme.lightTheme.textTheme.headline2,
            ),
            SizedBox(height: 32,),
            CustomTextForm(controller: idController, hint: 'Enter your ID', label: 'ID',),
            CustomTextForm(controller: passwordController, hint: 'Enter your Password', label: 'Password',suffixIcon: Icon(Icons.visibility_off_outlined),),
             Spacer(),
            CustomButton(text: 'Login', function: (){Navigator.pushNamed(context, HomeScreen.routeName);}, width: double.infinity),
          ],
        ),
      ),
    );
  }
}
