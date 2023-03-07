import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../Local/Component.dart';
import '../../Local/constants.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialStates());

  static HomeCubit get(context) => BlocProvider.of(context);
  List listCard = [
    createThreeMainCard(
        num: '18',
        firstWord: 'Successful',
        secondWord: 'delivered',
        colorOfCard: mainDarkColor),
    createThreeMainCard(
        num: '42',
        firstWord: 'Total',
        secondWord: 'picked up',
        colorOfCard: mainLightColor),
    createThreeMainCard(
        num: '53',
        firstWord: 'Cash',
        secondWord: 'collected',
        colorOfCard: grayColor,
        textColor: mainDarkColor),
  ];
  bool isConfirmThePath = false;
  MobileScannerController cameraController = MobileScannerController();
  List<String> myBarcodesList = [];
  List<String> myprevList = [];
  int showNumOfShipmentWhileScan = 1 ;
  bool isDialogOpen = false;
  bool isFloatingScanShow = true;

  ///////////path screen start ////////////////

  void onpressConfermPath() {
    isConfirmThePath = !isConfirmThePath;
    emit(HomePressedConferimPathStates());
  }

  ///////// path screen end ///////////////////

  ////////// barcode screen start /////////////
  void toggleTourchScanner() {
    cameraController.toggleTorch();
    emit(ScannerToggleTourchScannerState());
  }

  void toggleCameraScanner() {
    cameraController.switchCamera();
    emit(ScannerToggleCameraScannerState());
  }

  void detectBarcode(var capture , context ){
    cameraController = MobileScannerController();
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      debugPrint('Barcode found! ${barcode.rawValue}');
      if (!myBarcodesList.contains(barcode.rawValue.toString())  ) {
        if(myBarcodesList.isEmpty){
          isDialogOpen = true;
          myBarcodesList.add(barcode.rawValue.toString());
          emit(ScannerAddNewScanToListState());
          showAlertDialog(context , 'Scan next Shipment' , 'the first shipment scanned successfully . Please scan the next shipment' ).then((value) => isDialogOpen = false);
        }else if(myBarcodesList.length == 1){
          isDialogOpen = true;
          myBarcodesList.add(barcode.rawValue.toString());
          showNumOfShipmentWhileScan = 2;
          emit(ScannerAddNewScanToListState());
          showAlertDialog(context , 'Start task now' , 'the next shipment scanned successfully . Please press start Task button' ).then((value) => isDialogOpen = false);
        }else{
          if(isDialogOpen == false){
            isDialogOpen = true;
            showAlertDialog(context , 'Warning' , 'your two shipments scanned successfully . Please press start Task button' ).then((value) => isDialogOpen = false);
          }
        }
      }
      print(myBarcodesList.length);
    }
  }

  void clearMyScannerList(){
    myBarcodesList.clear();
    emit(ScannerClearListViewState());
  }
  void removeMyIndexFromMyScannerList(index){
    myBarcodesList.removeAt(index);
    emit(ScannerRemoveItemFromListViewState());
  }


  Future<void> showAlertDialog(context , String textHead , String textBody) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title:  Text(textHead),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(textBody),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void ScannerStartTaskButtom(){
    isFloatingScanShow = false ;
    emit(ScannerStartTaskButtomState());
  }
////////// barcode screen end /////////////
}


