import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_cubit.dart';
import 'package:serb_courier/Home%20Screen/HomeCubit/home_states.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Local/Component.dart';
class MyPathScreen extends StatelessWidget {
  const MyPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
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
                          padding: const EdgeInsets.all(8.0),
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
                createTrackingCard(context),

              ],
            ),
          ),
        );
      },
    );
  }
}
