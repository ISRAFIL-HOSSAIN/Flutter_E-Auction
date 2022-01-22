import 'package:flutter/material.dart';
import 'package:flutter_eauction/const/AppColors.dart';
import 'package:flutter_eauction/widgets/fetchallbid.dart';

class AllBidList extends StatefulWidget {
  const AllBidList({ Key? key }) : super(key: key);

  @override
  _AllBidListState createState() => _AllBidListState();
}

class _AllBidListState extends State<AllBidList> {
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
        child: fetchAllBid("Bid-list"),
      ),
    );
  }
}