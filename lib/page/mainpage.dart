import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Expanded(
      child: Scaffold(
        appBar: MyAppBar(AppBar()),
        drawer: MyDrawer(),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Color of yujeong', //제목 받아와야함
                  style: TextStyle(
                    fontSize: height * 0.035,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.01),
                ),
                Container(
                  width: width * 0.5,
                  child: Text(
                    '-김유정', //작가명 받아와야함
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.03),
                ),
                Container(
                  width: width * 0.75,
                  child: Image.asset('assets/images/artwork.jpg',
                      fit: BoxFit.contain), //이미지 받아오는 기능으로 바꿔야함
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.03),
                ),
                Text(
                  'Rest time',
                  style: TextStyle(
                    fontSize: height * 0.035,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.01),
                ),
                _buildTimer(width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimer(double width, double height) {
    return Container(
      width: width * 0.75,
      child: Text(
        '02 : 43 : 21', //타이머 구현해야함
        style: TextStyle(
          fontSize: height * 0.05,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
