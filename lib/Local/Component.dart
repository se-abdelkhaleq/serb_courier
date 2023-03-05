import 'package:flutter/material.dart';
import 'package:serb_courier/delivery/delivery.dart';

import 'constants.dart';

Widget createTrackingCard(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: mainLightColor,
                width: 2,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Tracking number',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis)),
                    Spacer(),
                    Text('Status',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('#9862846214878',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600)),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: mainLightColor,
                        border: Border.all(
                          color: mainLightColor,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Pending',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      color: mainDarkColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('New York',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text('24-9-22 . 10 PM',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      color: mainDarkColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('London',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text('25-9-22 . 10 PM',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: mainDarkColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: lightblue,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              size: 20,
                              color: lightblue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('call',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainDarkColor,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.message,
                              size: 20,
                              color: lightblue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('message',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainDarkColor,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 20,
                              color: lightblue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('location',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainDarkColor,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: lightblue,
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            size: 20,
                            color: lightblue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text('cancel',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: mainDarkColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
Navigator.pushNamed( context, DeliveryDone.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.done,
                              size: 20,
                              color: lightblue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('delivery',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainDarkColor,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget createThreeMainCard(
    {BuildContext? context,
    int? index,
    required String num,
    required String firstWord,
    required String secondWord,
    required Color colorOfCard,
    Color? textColor}) {
  return InkWell(
    onTap: () {
/*
      navigateTo(context, ItemsShipmentScreens() );
*/
    },
    child: Container(
      width: 180,
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/serb_icon.png',
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$num',
              style: TextStyle(fontSize: 50, color: textColor ?? Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text('$firstWord',
                style:
                    TextStyle(fontSize: 20, color: textColor ?? Colors.white)),
            Text('$secondWord',
                style:
                    TextStyle(fontSize: 18, color: textColor ?? Colors.white)),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: colorOfCard,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: colorOfCard,
            width: 2,
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ]),
    ),
  );
}
