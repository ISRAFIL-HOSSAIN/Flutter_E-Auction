import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eauction/const/AppColors.dart';
import 'package:flutter_eauction/ui/bottom_nav_pages/mybidlist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context, CupertinoPageRoute(builder: (_) => MyBidList())),
                  child: Text(
                    "Show My Bid List",
                    style: TextStyle(color: Colors.red, fontSize: 22.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}
