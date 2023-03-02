import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:serb_courier/Home%20Screen/path_screen.dart';
import 'package:serb_courier/Local/constants.dart';
import 'package:hexcolor/hexcolor.dart';

import 'HomeCubit/home_cubit.dart';
import 'history_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit  , HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(title: Text('Yasser Morgan'),
              systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: HexColor('#63ade1')),
              backgroundColor: HexColor('#63ade1'),
              leading: Padding(
                padding: const EdgeInsets.only(top :10.0 , bottom: 8 ,left:  8 , right: 8 ),
                child: CircleAvatar(backgroundColor: darkblue, child: Text('3' , style: TextStyle(color: Colors.white))),
              ),
              bottom: TabBar(tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:  20.0 , bottom: 20.0),
                  child: Text('My Path'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:  20.0 , bottom: 20.0),
                  child: Text('History'),
                ),
              ]),

            ),

            body: TabBarView(
              children: [
                MyPathScreen(),
                HistoryScreen(),
              ],

            ),

          ),
        );
      },

    );
  }
}
