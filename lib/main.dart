import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_cubit.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:serb_courier/Home%20Screen/home_screen.dart';
import 'package:serb_courier/delivery/delivery.dart';
import 'package:serb_courier/delivery/not_delivered.dart';
import 'package:serb_courier/history/delivery_details.dart';
import 'package:serb_courier/history/history_screen.dart';
import 'package:serb_courier/splash/splash_screen.dart';
import 'package:serb_courier/testNavBar.dart';

import 'Home Screen/HomeCubit/bloc_observer.dart';
import 'login/login.dart';
import 'login_screen/login_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit  , HomeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme:ThemeData(fontFamily: 'Open_Sans'),
            routes: {
              SplashScreen.routeName:(_)=>SplashScreen(),
              login.routeName:(_)=>login(),
              LoginScreen.routeName:(_)=>LoginScreen(),
              HistoryScreen.routeName:(_)=>HistoryScreen(),
              HomeScreen.routeName:(_)=>HomeScreen(),
              DeliveryDetails.routeName:(_)=>DeliveryDetails(),
              DeliveryDone.routeName:(_)=>DeliveryDone(),
              NotDelivered.routeName:(_)=>NotDelivered(),
            },
            initialRoute: SplashScreen.routeName,
          );
        },
      ),
    );
  }
}

