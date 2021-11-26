import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../model/auction_price.dart';
import '../../page/join_auction/join_auction_form.dart';

class JoinAuctionPage extends StatefulWidget {
  AuctionPrice price;
  JoinAuctionPage({required this.price});
  _JoinAuctionPage createState() => _JoinAuctionPage();
}

class _JoinAuctionPage extends State<JoinAuctionPage> {

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(AppBar()),
        drawer: MyDrawer(),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Text(
                  '참여 가능한 제안',
                  style: TextStyle(
                    fontSize: height * 0.024,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
                AuctionForm(width: width, height: height, total: widget.price.totalPrice, remainRatio: widget.price.remainRatio),
              ],
            ),
          ),
        ),
      ),
    );
  }
}