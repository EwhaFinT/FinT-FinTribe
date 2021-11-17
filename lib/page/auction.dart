import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class AuctionPage extends StatefulWidget {
  // 경매 정보 받아와야 함
  _AuctionPage createState() => _AuctionPage();
}
class _AuctionPage extends State<AuctionPage> {

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
                Column(
                    children: <Widget> [
                      Container(
                        padding: EdgeInsets.all(width * 0.04),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: const Color(0xffededed),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '현재 상한가',
                              style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.02,
                                  width * 0.02,
                                  width * 0.1,
                                  width * 0.02
                              ),
                            ),
                            Text(
                              'KLAY',
                              style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildNewSuggestion(width, height),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildSuggestions(width, height),
                    ]
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget _buildNewSuggestion(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xffededed),
      ),
      child: Column(
        children: [
          Text(
            '새로운 제안',
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          _buildTextField(width, height, '합산 금액'),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildTextField(width, height, '희망 지분'),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          Container(
            width: width * 0.8,
            alignment: Alignment.bottomRight,
            child: Text(
              '예상 지불 금액: KLAY',
              style: TextStyle(
                fontSize: height * 0.015,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildSuggestButton(width, height),
        ],
      ),
    );
  }

  Widget _buildTextField(double width, double height, String label) {
    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.018,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Expanded(
          child: TextField(
            style: TextStyle(height: 0.8),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestButton(double width, double height) {
    return TextButton(
      onPressed: () { // 제안 기능 구현 필요

      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xffc4c4c4),
        ),
        child: Container(
          width: width * 0.2,
          height: height * 0.05,
          alignment: Alignment.center,
          child: Text(
            '제안하기',
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffededed),
      ),
      child: Column(
        children: [
          Text(
            '참여 가능한 제안',
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          _buildJoinSuggestion(width, height),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildJoinSuggestion(width, height),
        ],
      ),
    );
  }

  Widget _buildJoinSuggestion(double width, double height) {
    return Container(
      width: width * 0.8,
      padding: EdgeInsets.all(width * 0.03),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffc4c4c4),
      ),
      alignment: Alignment.center,
      child: Text(
        '200 KLAY / 240 KLAY',
        style: TextStyle(
          fontSize: height * 0.02,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}