import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/custom_button.dart';
import 'package:serb_courier/history/delivery_details.dart';
import 'package:serb_courier/history/pending/pending_cubit/pending_cubit.dart';
import 'package:serb_courier/history/rejected.dart';
import '../../Home Screen/home_screen.dart';
import '../../Home Screen/path_screen.dart';
import '../../constants/constants.dart';

class PendingScreen extends StatefulWidget {



  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PendingCubit,PendingState>(
    listener: (context ,State){},
    builder: (context,State){
      var cubit=PendingCubit.get(context);

      return  Scaffold(
      body: ListView.builder(
      itemBuilder: (context, index) => createTrackingCard(index),
    itemCount: cubit.trackingNum.length),
    );
    });
  }

  Widget createTrackingCard(int index) {

    return BlocConsumer<PendingCubit,PendingState>(
      listener: (context,State){

      },
      builder: (context,State){
        var Cubit=PendingCubit.get(context);

        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 190,
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
                        InkWell(
                          onTap: () {
/*                           Cubit.removeItem(index);
Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyPathScreen()),
                          );*/

                          },
                          child: Row(
                            children: [
                              Text('Tracking number',
                                  maxLines: 1,
                                  style: MyTheme.lightTheme.textTheme.headline2),
                              Spacer(),
                              Text(Cubit.trackingNum[index],
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkblue,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, DeliveryDetails.routeName);
                          },
                          child: InkWell(
                            child: Row(
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
                          ),
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
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            CustomButton(
                              text: 'Pending',
                              function: () {
                                Cubit.selectedCurrentIndex(index);
                                Navigator.pushNamed(
                                    context, DeliveryDetails.routeName);
                              },
                              width: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
