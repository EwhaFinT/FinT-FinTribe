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

  AuctionInitialize intialValue = AuctionInitialize(
      upperLimit: 0,
      priceList: []
  );

  @override
  void initState() {
    super.initState();
    _loadPriceList();
  }

  _loadPriceList() async {
    final _intialValue = await ReceiveFromServer().loadSuggestions();
    setState(() {
      intialValue.upperLimit = _intialValue.upperLimit;
      intialValue.priceList = _intialValue.priceList;
    });
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
                UpperLimit(width: width, height: height, upperLimit: intialValue.upperLimit),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
                NewSuggestion(width: width, height: height),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
                Suggestions(width: width, height: height, priceList: intialValue.priceList),
             ],
          ),
        ),
      ),
    );
  }
}