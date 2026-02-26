import 'dart:io';

import 'package:bookingapp/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key});

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  bool isChecked = false,
      isChecked1 = false,
      isChecked2 = false,
      isChecked3 = false;
  File? selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController hotelChargesController = TextEditingController();
  final TextEditingController hotelAddressController = TextEditingController();
  final TextEditingController hotelDescriptionController =
      TextEditingController();

  Future getImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future addData() async {
    try {
      if (selectedImage == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Please select an image")));
        return;
      }
      if (hotelNameController.text.isEmpty ||
          hotelChargesController.text.isEmpty ||
          hotelAddressController.text.isEmpty ||
          hotelDescriptionController.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("All fields Are Required")));
        return;
      }
      final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      final path = 'uploads/$fileName';

      // Upload image first
      await Supabase.instance.client.storage
          .from('hotelimages')
          .upload(path, selectedImage!);

      final imgUrl = Supabase.instance.client.storage
          .from('hotelimages')
          .getPublicUrl(path);

      await FirebaseFirestore.instance.collection('Hotel').doc().set({
        'hotelName': hotelNameController.text,
        'hotelCharges': hotelChargesController.text,
        'hotelAddress': hotelAddressController.text,
        'hotelDescription': hotelDescriptionController.text,
        'imgUrl': imgUrl,
        'services' : {
          'wifi': isChecked,
          'tv': isChecked1,
          'kitchen': isChecked2,
          'bathroom': isChecked3,
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Hotel Added Successfully"),
        ),
      );
      Navigator.pushNamed(context, "/hotelOwnerHomeScreen");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hotel Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      selectedImage != null
                          ? Center(
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),

                      SizedBox(height: 20),
                      Text("Hotel Name", style: AppWidget.normalTextStyle(20)),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0XFFECECF8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: hotelNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Name",
                            hintStyle: AppWidget.normalTextStyle(18),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Hotel Room Charges",
                        style: AppWidget.normalTextStyle(20),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0XFFECECF8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: hotelChargesController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Room Charges",
                            hintStyle: AppWidget.normalTextStyle(18),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Hotel Address",
                        style: AppWidget.normalTextStyle(20),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0XFFECECF8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: hotelAddressController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Address",
                            hintStyle: AppWidget.normalTextStyle(18),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'What service you want to offer?',
                            style: AppWidget.headlineTextStyle(22),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.wifi,
                            color: Color.fromARGB(255, 7, 102, 179),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text('Wifi', style: AppWidget.normalTextStyle(23)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isChecked1,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.tv,
                            color: Color.fromARGB(255, 7, 102, 179),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text('Hd Tv', style: AppWidget.normalTextStyle(23)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isChecked2,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked2 = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.kitchen,
                            color: Color.fromARGB(255, 7, 102, 179),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text('Kitchen', style: AppWidget.normalTextStyle(23)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isChecked3,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked3 = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.bathroom,
                            color: Color.fromARGB(255, 7, 102, 179),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Bathroom',
                            style: AppWidget.normalTextStyle(23),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Hotel Description',
                            style: AppWidget.headlineTextStyle(22),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0XFFECECF8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: hotelDescriptionController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter About Hotel",
                            hintStyle: AppWidget.normalTextStyle(18),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: addData,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
