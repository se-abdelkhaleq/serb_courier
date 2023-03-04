import 'package:flutter/material.dart';

import '../constants/constants.dart';

class RejectedScreen extends StatelessWidget {
  const RejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context,index)=>createTrackingCard(),itemCount: 10),
    );
  }
  Widget createTrackingCard() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
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
                            style: TextStyle(
                                fontSize: 16,
                                color: darkblue,
                                overflow: TextOverflow.ellipsis)),
                        Spacer(),
                        Text('Status',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: darkblue,
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
                                color: darkblue,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600)),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: darkblue,
                            border: Border.all(
                              color: darkblue,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Rejected',
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
                            style: TextStyle(
                                fontSize: 16,
                                color: darkblue,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400)),
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
                                          color: darkblue,
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
                                          color: darkblue,
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
                                          color: darkblue,
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
                                        color: darkblue,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Row(
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
                                        color: darkblue,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
