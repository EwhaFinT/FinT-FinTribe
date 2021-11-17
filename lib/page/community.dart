import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class CommunityPage extends StatefulWidget {
  _CommunityPage createState() => _CommunityPage();
}
class _CommunityPage extends State<CommunityPage> {

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
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      _buildHeader(width, height),
                      _Padding(width),
                      Expanded(
                          child: ListView(
                              children: <Widget> [
                                _buildMyinfo(width, height),
                                _Padding(width),
                                Container(
                                  padding: EdgeInsets.all(width * 0.04),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: const Color(0xffededed),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      _buildArtwokInfo(width, height),
                                      _buildAboutSuggest(width, height),
                                    ],
                                  ),
                                ),
                                Container(        //댓글 컨테이너
                                  padding: EdgeInsets.all(width * 0.04),
                                  child:Column(
                                      children: <Widget>[
                                        _buildCommentHeader(width, height),
                                        _buildCommentContent(width, height),
                                    ],
                                  ),

                                ),
                        ],
                          ),
                      ),
                      _Padding(width),
                      _buildComment(width, height),


              ]
          ),
        ),
      ),
      ),
    );
  }

  Widget _Padding(double width){
    return Padding(padding: EdgeInsets.all(width * 0.02));
  }
  Widget _buildHeader(double width, double height) {
    // 첫번째 컨테이너: 작품 정보
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Expanded(
            flex: 9,
            child: Container(
                width: width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
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
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Image.asset('assets/images/write_icon.png'),

          ),
        ),
      ],
    );
  }
  Widget _buildMyinfo(double width, double height){
    return Row(
        children: <Widget>[
          Container(
            width: width * 0.1,
            child: Image.asset('assets/images/circle.png', fit:BoxFit.contain),   //이미지 받아오는 기능으로 바꿔야함
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.01),
          ),
          Text(
            '작성자 이름',
            style: TextStyle(
              fontSize: height * 0.025,
            ),
          )
        ]
    );
  }
  Widget _buildAboutSuggest(double width, double height){
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
          Text(
          '김유정 작가가 최근 문화계에서 큰 업적을 쌓고 있습니다. 이에 따라 저희 유정이 작품도 더 값이 오를 것이라 믿습니다.',
            style: TextStyle(
            fontSize: height * 0.018,
            ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
  Widget _buildArtwokInfo(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Expanded(
          flex: 5,
          child: Container(
            child: Image.asset('assets/images/artwork.jpg'),

          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.02),
        ),
        Expanded(
          flex: 5,
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(
                    '재판매 제안',
                    style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '입찰 가격: ' '~~~' 'KLAY\n'
                      '경매 일시: ' '~~~',
                    style: TextStyle(
                        fontSize: height * 0.018,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  _Padding(width),
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
                            '낙찰 일시: \n'
                            '2021-11-04 13:01' 'KST\n',
                    style: TextStyle(
                      fontSize: height * 0.018,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
          ),
        ),

      ],
    );
  }
  Widget _buildCommentHeader(double width, double height) {
    return Row(
        children: <Widget>[
          Container(
            width: 30,
            child:Column(
              children: [
                Image.asset('assets/images/comment.png'),
                Padding(
                  padding: EdgeInsets.all(width * 0.03),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.01),
          ),
          _buildMyinfo(width, height),
        ]
    );
  }
  Widget _buildCommentContent(double width, double height) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffededed),
      ),
      child: Text(
        '반대합니다. 제가 유정이 작가 최측근인데 요즘 작품 스타일이 그 전과는 달라서'
            '어쩌구 저쩌구 얄리얄리얄라숑 얄라리 얄라 고흐 친구 고갱님',
        style: TextStyle(
          fontSize: height * 0.018,
        ),
 //       textAlign: TextAlign.left,
      ),
    );
  }
  Widget _buildComment(double width, double height) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
          Container(
            width: width * 0.75,
            height: height*0.07,
            padding: EdgeInsets.fromLTRB(width * 0.04, 0, width * 0.04, 0),
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: const Color(0xffededed),
            ),
            child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '댓글 쓰기',
                hintStyle: TextStyle(color: Colors.grey[300])),
            cursorColor: Colors.blue,
                ),
          ),
          TextButton(
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
                  height: height*0.05,
                  padding: EdgeInsets.all(width*0.02),
                  alignment: Alignment.center,
                 child: Text(
                     '작성',
                    style: TextStyle(
                      fontSize: height * 0.02,
                  fontWeight: FontWeight.bold,
                     ),
                  ),
                ),
              ),

    ),

      ],
    );
  }



}