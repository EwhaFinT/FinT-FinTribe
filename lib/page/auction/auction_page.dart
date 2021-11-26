import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../page/auction/auction_event.dart';
import '../../model/auction_initialize.dart';
import '../../model/auction_price.dart';
import '../../page/auction/auction_upper_limit.dart';
import '../../page/auction/auction_new_suggestion.dart';
import '../../page/auction/auction_suggestions.dart';

class AuctionPage extends StatefulWidget {
  // 경매 정보 받아와야 함
  _AuctionPage createState() => _AuctionPage();
}
class _AuctionPage extends State<AuctionPage> {

  Future<AuctionInitialize>? intialValue; // price 정보 받아오기

  @override
  void initState() {
    super.initState();
    intialValue = ReceiveFromServer().loadSuggestions();
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(AppBar()),
        drawer: MyDrawer(),
        body: Center(
          child: ListView(
              padding: EdgeInsets.all(width * 0.05),
              children: <Widget> [
                FutureBuilder<AuctionInitialize>(
                    future: intialValue,
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        int? upperLimit = snapshot.data?.upperLimit;
                        List<AuctionPrice>? priceList = snapshot.data?.priceList;

                        return Column(
                            children: <Widget> [
                              UpperLimit(width: width, height: height, upperLimit: upperLimit as int),
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                              ),
                              NewSuggestion(width: width, height: height),
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                              ),
                              Suggestions(width: width, height: height, priceList: priceList as List<AuctionPrice>),
                            ]
                        );
                      }
                      throw Exception();
                    }
                ),
              ]
          ),
        ),
      ),
    );
  }
}