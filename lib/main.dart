import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_cubit.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:serb_courier/Home%20Screen/home_screen.dart';
import 'package:serb_courier/delivery/not_delivered.dart';
import 'package:serb_courier/delivery/rejected.dart';
import 'package:serb_courier/history/delivery_details.dart';
import 'package:serb_courier/history/history_screen.dart';
import 'package:serb_courier/history/pending/pending_cubit/pending_cubit.dart';
import 'package:serb_courier/splash/splash_screen.dart';
import 'package:serb_courier/testNavBar.dart';

import 'Home Screen/HomeCubit/bloc_observer.dart';
import 'delivery/delivery_success.dart';
import 'login/login.dart';
import 'login_screen/login_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        ),
        BlocProvider<PendingCubit>(
          create: (_) => PendingCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
              DeliveryDoneSuccess.routeName:(_)=>DeliveryDoneSuccess(),
              NotDelivered.routeName:(_)=>NotDelivered(),
              Rejected.routeName:(_)=>Rejected(),
            },
            initialRoute: SplashScreen.routeName,
          );
        },
      ),
    );
  }
}

