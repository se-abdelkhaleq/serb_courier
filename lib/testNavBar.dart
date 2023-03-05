/*
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('qrView'),
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  Orientation prevOriantation = Orientation.portrait;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context , orientation) {
          if(orientation == Orientation.portrait){
            print("The screen is in Portrait mode");
            if(orientation != prevOriantation){
              controller?.pauseCamera();
              controller?.resumeCamera();
              prevOriantation = orientation;
              print('Came From LandScape');
            }

          }

          if(orientation == Orientation.landscape){
            print("The screen is on Landscape mode.");
            if(orientation != prevOriantation){
              controller?.pauseCamera();
              controller?.resumeCamera();
              prevOriantation = orientation;
              print('Came From portable');
            }

          }
          return Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _buildQrView(context),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller?.resumeCamera();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right_sharp),
                                  const Text('resume',
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  return Row(
                                    children: [
                                      Icon(snapshot.data.toString() == 'false' ? Icons.flash_off :Icons.flash_on),
                                      Text('Flash ${snapshot.data.toString() == 'false' ? 'off' : 'on'}' , style: TextStyle(fontSize: 14)),
                                    ],
                                  );
                                },
                              )),
                        ),
                        Expanded(
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller?.pauseCamera();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.pause),
                                  const Text('pause',
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              )),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (result != null)
                          Text(
                              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                        else
                          const Text('Scan a code'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await controller?.toggleFlash();
                                    setState(() {});
                                  },
                                  child: FutureBuilder(
                                    future: controller?.getFlashStatus(),
                                    builder: (context, snapshot) {
                                      return Text('Flash: ${snapshot.data}');
                                    },
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await controller?.flipCamera();
                                    setState(() {});
                                  },
                                  child: FutureBuilder(
                                    future: controller?.getCameraInfo(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        return Text(
                                            'Camera facing ${describeEnum(snapshot.data!)}');
                                      } else {
                                        return const Text('loading');
                                      }
                                    },
                                  )),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await controller?.pauseCamera();
                                },
                                child: const Text('pause',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await controller?.resumeCamera();
                                },
                                child: const Text('resume',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 5,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
*/

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController();
  List<String> myBarcodesList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
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
              onPressed: () => cameraController.switchCamera(),
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
                    controller: cameraController,
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        debugPrint('Barcode found! ${barcode.rawValue}');
                        if(!myBarcodesList.contains(barcode.rawValue)){
                          myBarcodesList.add(barcode.rawValue.toString());
                          print(myBarcodesList.length);
                        }
                      }
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
                              onPressed: () {}, child: Text('Start task')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            textAlign:TextAlign.center ,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'we are ready to scan next shipment ',
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize:16),
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
  }
}
