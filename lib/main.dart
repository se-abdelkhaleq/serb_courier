import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_cubit.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:serb_courier/Home%20Screen/home_screen.dart';
import 'package:serb_courier/testNavBar.dart';

import 'Home Screen/HomeCubit/bloc_observer.dart';

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
            theme: ThemeData(fontFamily: 'Open_Sans'),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}


