import 'package:flutter/material.dart';
import 'package:serb_courier/constants/constants.dart';
import 'package:serb_courier/history/accepted.dart';
import 'package:serb_courier/history/pending.dart';
import 'package:serb_courier/history/rejected.dart';

class HistoryScreen extends StatelessWidget {
static const String routeName='history';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
     /*   appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Today's Job",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
          centerTitle: true,
          elevation: 0,


        ),*/
        body :Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children:[
                Container(
                height: 40,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TabBar(

                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      indicator: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey, //New
                                blurRadius: 4.0,
                                offset: Offset(1, 1))
                          ],
                          color:lightblue,
                          borderRadius: BorderRadius.circular(12)),
                      indicatorColor: Colors.red,
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Pending',
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Accepted'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Rejected'),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
SizedBox(height: 22,),

            Expanded(
              child: SizedBox(
                child: TabBarView(

                  children: [
                    PendingScreen(),
                    AcceptedScreen(),
                    RejectedScreen(),
                  ],
                ),
              ),
            ),
            ],
      ),
          ),
        ),
      ),

    );
  }
}
