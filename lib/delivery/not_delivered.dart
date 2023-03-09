import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/appbar.dart';
import 'package:serb_courier/constants/widgets/custom_button.dart';
import 'package:signature/signature.dart';

import '../constants/widgets/custom_dropSearch.dart';

class NotDelivered extends StatefulWidget {
  static const String routeName = 'notdelivered';

  @override
  State<NotDelivered> createState() => _NotDeliveredState();
}

class _NotDeliveredState extends State<NotDelivered> {
  TextEditingController toController = TextEditingController();
  File? image;
  //Uint8List? exportedImage;

  String selectedImagePath = '';
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.white,
    exportBackgroundColor: Colors.yellowAccent,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(title: 'Delivery'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipment Status',
                    style: MyTheme.lightTheme.textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'not delivered',
                    style: MyTheme.lightTheme.textTheme.headline4,
                  ),                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Comment (optional)',
                    style: MyTheme.lightTheme.textTheme.headline4,
                  ),
                  CustomdropSearch(
                    hintText: 'Your Comment',
                    items: [
                      'The receiver is not at the delivery location',
                      'The customer requested to collect it from the Serb branch',
                      'Wrong address',
                      'Delivery time has expired',
                      'Money is not available',
                      'no one at home',
                      'office closed'
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                textAlign: TextAlign.start,
                'Add Photo (optional)',
                style: MyTheme.lightTheme.textTheme.headline4,
              ),
              selectedImagePath == ''
                  ? Image.asset(
                      'assets/images/image_placeholder.png',
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      File(selectedImagePath),
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                  text: 'Select',
                  function: () async {
                    selectImage();
                    setState(() {});
                  },
                  width: 80),

              /*   Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                 */ /*       Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () async {
                                  exportedImage = await controller.toPngBytes();
                                  //API
                                  setState(() {});
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.red)))))),*/ /*

                      ],
                    ),*/
              SizedBox(
                height: 10,
              ),
              CustomButton(text: 'Save', function: (){}, width: double.infinity),

              /*     if (exportedImage != null)
                      Image.memory(
                        exportedImage!,
                        width: 300,
                        height: 250,
                      )*/
            ],
          ),
        )));
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              selectedImagePath =
                                  await selectImageFromGallery();
                              print('Image_Path:-');
                              print(selectedImagePath);
                              if (selectedImagePath != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("No Image Selected !"),
                                ));
                              }
                            },
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/gallery.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text('Gallery'),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              selectedImagePath = await selectImageFromCamera();
                              print('Image_Path:-');
                              print(selectedImagePath);

                              if (selectedImagePath != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("No Image Captured !"),
                                ));
                              }
                            },
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/camera.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text('Camera'),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
