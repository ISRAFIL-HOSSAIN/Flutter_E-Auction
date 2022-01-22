// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_eauction/ui/login_screen.dart';
import 'package:flutter_eauction/const/AppColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),()=>Navigator.push(context,CupertinoPageRoute(builder:(_)=>LoginScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: SafeArea(
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(
                "E-Auction",
                style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:48.sp),
              ),
              SizedBox(height:10.h,),
              CircularProgressIndicator(color:Colors.white,),

            ],

          ),
        ),
      ),
    );
  }

}

