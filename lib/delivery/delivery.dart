
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serb_courier/constants/my_theme.dart';
import 'package:serb_courier/constants/widgets/appbar.dart';
import 'package:serb_courier/constants/widgets/custom_dropDown.dart';
import 'package:serb_courier/constants/widgets/custom_text_form.dart';
import 'package:whiteboard/whiteboard.dart';

class DeliveryDone extends StatefulWidget {
  static const String routeName = 'deliveryDone';

  @override
  State<DeliveryDone> createState() => _DeliveryDoneState();
}

class _DeliveryDoneState extends State<DeliveryDone> {
  TextEditingController toController = TextEditingController();
  File? image;
  String selectedImagePath = '';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipment Status',
                style: MyTheme.lightTheme.textTheme.headline2,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropDown(),
              const SizedBox(
                height: 28,
              ),
              CustomTextForm(controller: toController, hint: 'to', label: 'to'),
              Text(
                'Add Photo (optional)',
                style: MyTheme.lightTheme.textTheme.headline4,
              ),
              GestureDetector(
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
                          /*    Image.asset(
                            'assets/images/camera.png',
                            height: 60,
                            width: 60,
                          )*/
                          Text('Camera'),
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 50,),
              Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                selectedImagePath == ''
                    ?Icon(Icons.aspect_ratio)
                    : Image.file(File(selectedImagePath), height: 200, width: 200, fit: BoxFit.fill,),
                ],
                ),
              ),
              SizedBox(height: 50,),

              Text(
                'Signature',
                style: MyTheme.lightTheme.textTheme.headline4,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: WhiteBoard(),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
  }
}