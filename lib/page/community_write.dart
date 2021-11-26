import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/button.dart';

class CommunityWritePage extends StatefulWidget {
  _CommunityWritePage createState() => _CommunityWritePage();
}
class _CommunityWritePage extends State<CommunityWritePage> {

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
            padding: EdgeInsets.all(width * 0.04),
              children: <Widget> [
              Column(
                children: <Widget>[
                  _buildHeader(width, height),
                  _Padding(width),
              Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color(0xffededed),
                ),
                child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(width * 0.01),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '제목',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                              ),
                            ),
                            _Padding(width),
                            _buildTextField(width, height),
                          ],
                        ),
                      ),
                      _Padding(width),
                      Container(
                        width: width * 0.75,
                        child: Image.asset('assets/images/artwork.jpg', fit:BoxFit.contain),   //이미지 받아오는 기능으로 바꿔야함
                      ),
                      _Padding(width),
                      _buildArtwokInfo(width, height),
                      _buildSuggestText(width, height),
                    ],
                ),

              ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                  ),
                  GradientButton(buttonName: 'SUGGEST'),
                ]
            ),
          ],
          ),
        ),
      ),
    );
  }

  Widget _Padding(double width) {
    return Padding(padding: EdgeInsets.all(width * 0.02));
  }

  Widget _buildHeader(double width, double height) {
    // 첫번째 컨테이너: 작품 정보
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
              width: width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Community',
                    style: TextStyle(
                        fontSize: height * 0.028,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.01),
                  ),
                  Text(
                    'Artwork Name',
                    style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
          ),
      ],
    );
  }
  Widget _buildTextField(double width, double height){
    return Container(
      width: 280,
      padding: EdgeInsets.fromLTRB(width * 0.04, 0, width * 0.04, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white
      ),
      child: TextField(
        

        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[300])),
        cursorColor: Colors.blue,
      ),
    );
  }
  Widget _buildArtwokInfo(double width, double height) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [

            Text(
              '기존 작품 정보',
              style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              '작품명: ' '~~~\n'
                  '작가: ' '~~~\n'
                  '낙찰 가격: ' '~~~' 'KLAY\n'
                  '낙찰 일시: ' '2021-11-04 13:01 ' 'KST\n',
              style: TextStyle(
                fontSize: height * 0.018,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        )
    );
  }
  Widget _buildSuggestText(double width, double height){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Text(
          '제안 내용',
          style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,
        ),
        _Padding(width),
        Container(
          height: 250,
            padding: EdgeInsets.fromLTRB(width * 0.04, 0, width * 0.04, 0),
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white
          ),
          child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[300])),
              cursorColor: Colors.blue,
        ),
      ),
      ],
    );
  }
}