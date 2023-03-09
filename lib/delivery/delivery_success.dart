

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serb_courier/constants/widgets/custom_dropDown.dart';
import 'package:signature/signature.dart';

import '../constants/my_theme.dart';
import '../constants/widgets/appbar.dart';
import '../constants/widgets/custom_button.dart';
import '../constants/widgets/custom_dropSearch.dart';
import '../constants/widgets/custom_text_form.dart';

class DeliveryDoneSuccess extends StatefulWidget {
  static const String routeName = 'deliveryDone';

  @override
  State<DeliveryDoneSuccess> createState() => _DeliveryDoneSuccessState();
}

class _DeliveryDoneSuccessState extends State<DeliveryDoneSuccess> {
  TextEditingController toController = TextEditingController();
  TextEditingController commentController = TextEditingController();
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
CustomDropDownButton(),
                    ],
                  ),

                  const SizedBox(
                    height: 28,
                  ),
                  CustomTextForm(controller: toController, hint: 'to', label: 'to'),
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
                  const SizedBox(height: 22),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comment (optional)',
                        style: MyTheme.lightTheme.textTheme.headline4,
                      ),
                      const SizedBox(height: 12),

                      CustomTextForm(controller: commentController, hint: 'your comment', label: '',),
                      const SizedBox(height: 24),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Signature',
                        style: MyTheme.lightTheme.textTheme.headline4,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        
                        child: Signature(
                          controller: controller,
                          width: 350,
                          height: 200,

                          backgroundColor: Colors.lightBlue[100]!,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  CustomButton(
                      text: 'Clear',
                      function: () {
                        controller.clear();
                      },
                      width: double.infinity),



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
