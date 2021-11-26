import 'package:flutter/material.dart';
import '../page/artwork.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {

  var tb;
  int hour = 3;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timetodisplay = "";
  bool checktimer = true;

  @override
  void initState() {
    tb = TabController(
      length: 2,

      vsync: this,
    );
    super.initState();
  }

  void start() {
    setState(() {
      started = false;
      stopped = false;
    });
    timeForTimer = ((hour * 60 * 60) + (min * 60) + sec);
    Timer.periodic(Duration(
      seconds: 1,
    ), (Timer t) {
      setState(() {
        if (timeForTimer < 1 || checktimer == false) {
          t.cancel();
          if (timeForTimer == 0) {}
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MainPage(),
          ));
        }
        else if (timeForTimer < 60) {
          timetodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timetodisplay =
              h.toString() + ":" + m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        }
      });
    });
  }


  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double width = screenSize.width;
    double height = screenSize.height;
    if (started) {
      start();
    }
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
                  padding: EdgeInsets.all(width * 0.01),
                ),
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/images/artwork.jpg',
                        fit: BoxFit.contain),
                    iconSize: width * 0.75,
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) =>
                          ArtworkPage()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.01),
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
                Text(
                  timetodisplay,
                  style: TextStyle(
                    fontSize: 43.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],

            ),
          ),

        ),
      ),
    );
  }
}