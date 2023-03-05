import 'package:flutter/material.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/appbar.dart';

import '../Local/constants.dart';

class DeliveryDetails extends StatelessWidget {
static const String routeName='delivery details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: lightblue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
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
                           style: MyTheme.lightTheme.textTheme.headline4),
                          Spacer(),
                          Text('24-9-22 . 10 PM',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: darkblue,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400)),
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
                              style: MyTheme.lightTheme.textTheme.headline4),
                          Spacer(),
                          Text('25-9-22 . 10 PM',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: darkblue,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400)),
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
          ),
        ],
      ),
    );
  }
}
