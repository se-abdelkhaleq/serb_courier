import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_cubit.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serb_courier/constants/constants.dart';

import '../Local/Component.dart';
import '../testNavBar.dart';
class MyPathScreen extends StatelessWidget {
  const MyPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: lightblue,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomeTest()));
            } , child: Icon(Icons.qr_code_2_sharp , color: Colors.white),),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !cubit.isConfirmThePath
                      ? InkWell(
                          onTap: () {
                            cubit.onpressConfermPath();
                            print(cubit.isConfirmThePath);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only( right: 8.0 , top: 8.0 , left: 8.0 , bottom: 8.0),
                            child: Text(
                              'Confirm the path',
                            ),
                          ))
                      : Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Start mission',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Spacer(),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add , size: 25) , ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 25)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.timer_outlined, size: 25)),
                            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.clipboardList, size: 20)),
                            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.ellipsisVertical , size: 20 )),

                          ],
                        ),

                  Container(
                    height: 240,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return cubit.listCard[index];
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 3,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListView.separated(physics: BouncingScrollPhysics(),
                      shrinkWrap: true, itemBuilder: (context , index)=>createTrackingCard(context), separatorBuilder:(context , index)=> SizedBox(height: 6), itemCount: 4)


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
