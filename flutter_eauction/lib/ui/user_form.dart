import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eauction/const/AppColors.dart';
import 'package:flutter_eauction/widgets/customButton.dart';
import 'package:flutter_eauction/widgets/myTextField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'bottom_nav_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _Product_nameController = TextEditingController();
  final TextEditingController _Product_descriptionController =
      TextEditingController();
  final TextEditingController _Minbidprice_Controller = TextEditingController();
  final TextEditingController _EndTimeController = TextEditingController();

  // For DateTime Picker .....................

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _EndTimeController.text =
            "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }
  }

  // For Image Picker ....................

  File? _image;
  final picker = ImagePicker();

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        } else {
          Fluttertoast.showToast(msg: "no image selected");
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  // For Image Upload in Firebase ..........................

  Future uploadImage(File _image) async {
    String url;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('product_image')
        .child('product_image$imgId');
    await reference.putFile(_image);
    url = await reference.getDownloadURL();
    return url;
  }

  // Data Upload in Firebase Database .................

  Future sendUserDataToDB() async {
    FirebaseFirestore _auth = FirebaseFirestore.instance;
    final imgurl = await uploadImage(_image!);

    await _auth
        .collection("users-form-data")
        .add({
          "Pro_name": _Product_nameController.text,
          "Pro_desc": _Product_descriptionController.text,
          "Pro_photo": imgurl,
          "Bid_price": _Minbidprice_Controller.text,
          "End_time": _EndTimeController.text,
        })
        .whenComplete(
            () => Fluttertoast.showToast(msg: "User data added Successfully"))
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const BottomNavController())))
        .catchError((error) =>
            Fluttertoast.showToast(msg: "something is wrong.$error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Submit the form to continue.",
                  style:
                      TextStyle(fontSize: 22.sp, color: AppColors.deep_orange),
                ),
                Text(
                  "Add your Auction information.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFBBBBBB),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),

                // For Image Pick

                Center(
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: const Color(0xFF4A148C))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _image == null
                              ? const Center(child: Text('no image selected'))
                              : Image.file(_image!),
                        ),
                        // Text('no image selected'),
                        ElevatedButton(
                            onPressed: () {
                              imagePicker();
                            },
                            child: const Text('Select Image')),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),

                myTextField("Product Name", TextInputType.text,
                    _Product_nameController),
                myTextField("Description", TextInputType.multiline,
                    _Product_descriptionController),
                myTextField("Min Bid Price ", TextInputType.number,
                    _Minbidprice_Controller),

                TextField(
                  controller: _EndTimeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Auction End Time",
                    suffixIcon: IconButton(
                      onPressed: () => _selectDateFromPicker(context),
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),

                // elevated button
                customButton("Submit", () => sendUserDataToDB()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
