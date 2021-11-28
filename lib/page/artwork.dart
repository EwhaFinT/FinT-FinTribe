import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page/auction/auction_page.dart';
import '../page/login/login_page.dart';
import '../model/artwork.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class ArtworkPage extends StatefulWidget {
  Artwork artworkInfo;
  ArtworkPage({required this.artworkInfo});
  _ArtworkPage createState() => _ArtworkPage();
}

class _ArtworkPage extends State<ArtworkPage> {

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
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: width * 0.75,
                            child: Image.asset('assets/images/artwork.jpg', fit:BoxFit.contain),   //이미지 받아오는 기능으로 바꿔야함
                          ),
                          _Padding(width),
                          _buildAuthorName(width, height, widget.artworkInfo.artist, widget.artworkInfo.title),
                          Padding(
                            padding: EdgeInsets.all(width * 0.03),
                          ),
                          Padding(
                            padding: EdgeInsets.all(width * 0.03),
                          ),
                          _buildInfoField1(width, height, widget.artworkInfo.detail),
                          _Padding(width),
                          _buildInfoField2(width, height, widget.artworkInfo.nftAddress),
                          _Padding(width),
                          _buildInfoField3(width, height, '거래내역이 존재하지 않습니다.'),
                          _Padding(width),
                          TextButton(
                            onPressed: () async {
                              final prefs = await SharedPreferences.getInstance();
                              final userId = prefs.getInt('userId') ?? 0;

                              if(userId != 0) {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => AuctionPage())
                                );
                              }
                              else {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => LoginPage())
                                );
                              }
                            },
                            style: TextButton.styleFrom( primary: Colors.white),
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Color(0xffA4C7E6),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Container(
                                width: 220,
                                height: 50,
                                alignment: Alignment.center,
                                child: const Text(
                                  '경매 참여',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
  // Widget _buildArtworkInfo(double width, double height) {
  //   return Column(
  //     children: <Widget> [
  //       _buildInfoTextField(width, height, '작품명'),
  //       Padding(
  //         padding: EdgeInsets.all(width * 0.015),
  //       ),
  //       _buildInfoTextField(width, height, '작가'),
  //       Padding(
  //         padding: EdgeInsets.all(width * 0.015),
  //       ),
  //       //그래프 추가해야함!!
  //       _buildInfoPriceField(width, height, '낙찰가격'),
  //       Padding(
  //         padding: EdgeInsets.all(width * 0.015),
  //       ),
  //       _buildInfoTextField(width, height, '지분율'),
  //       Padding(
  //         padding: EdgeInsets.all(width * 0.015),
  //       ),
  //       _buildInfoPriceField(width, height, '내 지분'),
  //       Padding(
  //         padding: EdgeInsets.all(width * 0.015),
  //       ),
  //     ],
  //   );
  // }
  Widget _Padding(double width){
    return Padding(padding: EdgeInsets.all(width * 0.01));
  }
}
  Widget _buildAuthorName(double width, double height, String author, String title) {
    return Container(
      width: width * 0.75,
      child: Text(
        '${author} - ${title}',   //나중에 받아와야함
        style: TextStyle(
          fontSize: height * 0.018,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildTimer(double width, double height) {
    return Container(
      width: width * 0.75,
      child: Text(
        '02 : 43 : 21',   //타이머 구현해야함
        style: TextStyle(
          fontSize: height * 0.05,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildInfoField1(double width, double height, String label) {
    return Container(
        padding: EdgeInsets.fromLTRB(width * 0.04, 10, width * 0.04, width * 0.07),
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffabbae6),
    ),
    child: Column(
    children: [
        Container(
          width: width * 0.75,
          child: Text(
            '작품 설명',
            style: TextStyle(
            fontSize: height * 0.018,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.01),
        ),
        Container(    //받아온 정보 반환
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.02,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    );
  }
  Widget _buildInfoField2(double width, double height, String label) {
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.04, 10, width * 0.04, width * 0.07),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffA4C7E6),
      ),
      child: Column(
        children: [
          Container(
            width: width * 0.75,
            child: Text(
              '블록체인 등록정보',
              style: TextStyle(
                fontSize: height * 0.018,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.01),
          ),
          Container(    //받아온 정보 반환
            child: Text(
              label,
              style: TextStyle(
                fontSize: height * 0.02,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildInfoField3(double width, double height, String label) {
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.04, 10, width * 0.04, width * 0.07),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xff9AD8E7),
      ),
      child: Column(
        children: [
          Container(
            width: width * 0.75,
            child: Text(
              '거래 내역',
              style: TextStyle(
                fontSize: height * 0.018,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.01),
          ),
          Container(    //받아온 정보 반환
            child: Text(
              label,
              style: TextStyle(
                fontSize: height * 0.02,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }