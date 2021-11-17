import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class SuccessPage extends StatefulWidget {
  // 작품 정보 받아오기
  _SuccessPage createState() => _SuccessPage();
}

class _SuccessPage extends State<SuccessPage> {

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
                  child: Column(
                  children: <Widget>[
                    Text(
                    '당신의 제안이 낙찰되었습니다.',
                    style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                    ),
                    Image.asset('assets/images/metamask.png'),   //이미지 받아오는 기능으로 바꿔야함
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                    ),
                    _buildArtworkInfo(width, height),
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

  Widget _buildArtworkInfo(double width, double height) {
    return Column(
      children: <Widget> [
              _buildInfoTextField(width, height, '작품명'),
              Padding(
                padding: EdgeInsets.all(width * 0.015),
              ),
              _buildInfoTextField(width, height, '작가'),
              Padding(
                padding: EdgeInsets.all(width * 0.015),
              ),
              //그래프 추가해야함!!
              _buildInfoPriceField(width, height, '낙찰가격'),
              Padding(
                padding: EdgeInsets.all(width * 0.015),
              ),
              _buildInfoTextField(width, height, '지분율'),
              Padding(
                padding: EdgeInsets.all(width * 0.015),
              ),
              _buildInfoPriceField(width, height, '내 지분'),
              Padding(
                padding: EdgeInsets.all(width * 0.015),
              ),
            ],
      );
  }


  Widget _buildInfoTextField(double width, double height, String label) {
    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.02,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Container(    //받아온 정보 반환
          child: Text(
            '받아온 정보',
            style: TextStyle(
              fontSize: height * 0.02,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoPriceField(double width, double height, String label) {
    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.02,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Container(
          child: Text(
            '받아온 정보',
            style: TextStyle(
              fontSize: height * 0.02,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Text(
          'KALY',
          style: TextStyle(
            fontSize: height * 0.02,
            color: Colors.black,
          ),
        ),
      ],
    );
  }


}
