import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eauction/const/AppColors.dart';
import 'package:flutter_eauction/widgets/fetchbidlist.dart';

class MyBidList extends StatefulWidget {
  const MyBidList({ Key? key }) : super(key: key);

  @override
  _MyBidListState createState() => _MyBidListState();
}

class _MyBidListState extends State<MyBidList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.deep_orange,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: fetchData("Bid-list"),
      ),
    );
  }
}