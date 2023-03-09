import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/appbar.dart';
import 'package:serb_courier/delivery/delivery_success.dart';
import 'package:serb_courier/history/pending/pending_cubit/pending_cubit.dart';

import '../Local/constants.dart';

class DeliveryDetails extends StatefulWidget {
static const String routeName='delivery details';
/*final int index;
DeliveryDetails(this.index);*/
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PendingCubit,PendingState>(
      listener: (context,State){},
      builder: (context,State){
        var cubit=PendingCubit.get(context);
        return Scaffold(

          floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.removeItem();
                Navigator.pop(context);
              },
              child: CircleAvatar(radius: 33,
                  child: Icon(Icons.swipe_up_outlined,size: 35,)),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CustomAppBar(
              title: 'Delivery Details',
            ),
          ),
          body: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Tracking number',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline2),
                            Spacer(),
                            Text('#9862846214878',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: darkblue,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600)),

                          ],
                        ),
                        SizedBox(height: 10),

                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: darkblue,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('New York',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: darkblue,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400)),
                            Spacer(),
                            Text('24-9-22 . 10 PM',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline4),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: darkblue,

                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('London',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: darkblue,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400)),
                            Spacer(),
                            Text('25-9-22 . 10 PM',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline4),
                          ],
                        ),
                        SizedBox(height: 16),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Weight',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline2),
                            SizedBox(width: 22),

                            Text('5 kg',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline4),
                          ],
                        ),
                        SizedBox(height: 16),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("The sender 's name",
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline2),
                            SizedBox(width: 22),

                            Text('yasser morgen',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline4),
                          ],
                        ),
                        SizedBox(height:26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("The receiver 's name",
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline2),
                            SizedBox(width: 22),

                            Text('raghda',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline4),
                          ],
                        ),
                        SizedBox(height:26),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("The driver 's name",
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline2),
                            SizedBox(width: 22),

                            Text('Serb driver 1',
                                maxLines: 1,
                                style: MyTheme.lightTheme.textTheme.headline4),
                          ],
                        ),
                        SizedBox(height: 16),

                        Text('Phone',style: MyTheme.lightTheme.textTheme.headline2),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Text("010203333",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis)),
                            SizedBox(width: 36),
                            Icon(Icons.call,color: darkblue,),
                            SizedBox(width: 4),

                            Text('Call',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: darkblue,
                                    overflow: TextOverflow.ellipsis)),
                            SizedBox(width: 30,),

                            Icon(Icons.message,color: darkblue,),
                            SizedBox(width: 4),

                            Text('Message',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: darkblue,
                                    overflow: TextOverflow.ellipsis)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
/*  Widget floatingAction(int index){
    return  BlocConsumer<PendingCubit,PendingState>(
      listener: (context,State){},
      builder: (context,State){
        return  CircleAvatar(radius: 33,
              child: Icon(Icons.swipe_up_outlined,size: 35,));
         onPressed: (){
            setState(() {
              Navigator.pop(context);
              Cubit.removeItem(index);
            });


          }

      },
    );
  }*/
}
