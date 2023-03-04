import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:serb_courier/Home%20Screen/path_screen.dart';
import 'package:serb_courier/Local/constants.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';


import 'HomeCubit/home_cubit.dart';
import 'history_screen.dart';
class HomeScreen extends StatefulWidget {
static const String routeName='home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();



  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit  , HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SideMenu(
          key: _endSideMenuKey,
          inverse: true,
          // end side menu
          background: Colors.green[700],
          type: SideMenuType.slideNRotate,
          menu: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: buildMenu(),
          ),
          onChange: (_isOpened) {
            setState(() => isOpened = _isOpened);
          },
          child: SideMenu(
            key: _sideMenuKey,
            menu: buildMenu(),
            type: SideMenuType.slideNRotate,
            onChange: (_isOpened) {
              setState(() => isOpened = _isOpened);
            },
            child: IgnorePointer(
              ignoring: isOpened,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 8, left: 8, right: 8),
                          child: CircleAvatar(
                              backgroundColor: darkblue,
                              child:
                              Text('3', style: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Yasser Morgan'),

                      ],
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => toggleMenu(),
                    ),
                    systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: HexColor('#63ade1')),
                    backgroundColor: HexColor('#63ade1'),
                    bottom: TabBar(tabs: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Text('My Path'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
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
              ),
            ),
          ),
        );
      },

    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                  child:Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child:Image.asset('assets/images/avatartwo.png' , width: 35) ,) ,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, Yasser Morgan",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Confirm path"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.map_outlined,
                size: 20.0, color: Colors.white),
            title: const Text("Road Path"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.truck,
                size: 16.0, color: Colors.white),
            title: const Text("Delivery process"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.box,
                size: 20.0, color: Colors.white),
            title: const Text("Receiving process"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
            const Icon(Icons.message_outlined, size: 20.0, color: Colors.white),
            title: const Text("Messages"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
            const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
            const Icon(Icons.logout, size: 20.0, color: Colors.white),
            title: const Text("Log out"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
