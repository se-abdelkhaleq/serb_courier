import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import '../Home Screen/HomeCubit/home_cubit.dart';
import '../Home Screen/HomeCubit/home_states.dart';
import '../Local/constants.dart';


class BarcodeScannerScreen extends StatelessWidget {
  BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Submit shipment'),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: cubit.cameraController.torchState,
                    builder: (context, state, child) {
                      switch (state as TorchState) {
                        case TorchState.off:
                          return const Icon(Icons.flash_off, color: Colors
                              .grey);
                        case TorchState.on:
                          return const Icon(Icons.flash_on, color: Colors
                              .yellow);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => cubit.toggleTourchScanner(),
                ),
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: cubit.cameraController.cameraFacingState,
                    builder: (context, state, child) {
                      switch (state as CameraFacing) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => cubit.toggleCameraScanner(),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      MobileScanner(
                        controller: cubit.cameraController,
                        onDetect: (capture) {
                          cubit.detectBarcode(capture , context);
                         /* if (!cubit.myBarcodesList[0].isEmpty) {
                            _showAlertDialog(context);
                          }*/
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Text('Scan your shipment',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ))),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Text(
                                'Confirm shipments',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: () {
                                    /*cubit.ScannerStartTaskButtom();*/
                                    Navigator.pop(context);
                                  }, child: Text('Start task')),
                            ],
                          ),
                        ),
                        Expanded(
                          child: cubit.myBarcodesList.length <= 0
                              ? Container(
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                'we are ready to scan next shipment ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          )
                              : SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                                child: Container(
                            child: Column(
                                children: [
                                  ListView.separated( physics: NeverScrollableScrollPhysics(),shrinkWrap: true, itemBuilder: (context , index) =>currentShipmentNumCard(context: context , index: index), separatorBuilder: (context , index) =>SizedBox(height: 10), itemCount: cubit.myBarcodesList.length),
                                ],
                            ),
                          ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget currentShipmentNumCard(
      {BuildContext? context, int? index, String? shipmentNumber}) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 240,
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
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 15, left: 15, right: 15),
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
                                Text('Number',
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
                                Expanded(
                                  child: Text('#${HomeCubit
                                      .get(context)
                                      .myBarcodesList[index!].toString()}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: mainDarkColor,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w600)),
                                  flex: 9,
                                ),

                                Expanded(

                                  child: Container(
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
                                        '${index !+1}',
                                        style:
                                        TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
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
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text('Number of items',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: mainDarkColor,
                                      overflow: TextOverflow.ellipsis,
                                    )),
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
                                      '3',
                                      style:
                                      TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 5),
                child: InkWell(
                    onTap: () {
                      /*HomeCubit.get(context).myBarcodesList = [];*/
                      HomeCubit.get(context).removeMyIndexFromMyScannerList(index);
                    },
                    child: Container(
                        width: 25,
                        height: 25,
                        child: CircleAvatar(
                          backgroundColor: darkblue,
                          child: Icon(Icons.close,
                              color: Colors.white, size: 15),
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }


}
