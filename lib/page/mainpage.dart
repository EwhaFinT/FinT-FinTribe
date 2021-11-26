import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:ntp/ntp.dart';
import 'package:intl/intl.dart';
//import 'package:timer_builder/timer_builder.dart';
import 'package:duration/duration.dart';

import '../page/artwork.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  // int secondsPassed = 0;
  // bool isActive = false;
  //
  // var timer;
  // late int seconds, minutes, hours;
  //
  // void initState() {
  //   super.initState();
  //   if (timer == null)
  //     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
  //       handleTick();
  //     });
  // }
  //
  // void handleTick() {
  //   if (isActive) {
  //     setState(() {
  //       secondsPassed = secondsPassed + 1;
  //       seconds = secondsPassed * 60;
  //       minutes = secondsPassed ~/ 60;
  //       hours = secondsPassed ~/ (60 * 60);
  //     });
  //   }
    // int _counter = 60*180;
    // var _timer;
    //
    // void _startTimer() {
    //   _counter = 60*180;
    //   if (_timer != null) {
    //     _timer.cancel();
    //   }
    //   _timer = Timer.periodic(Duration(hours:3), (timer) {
    //     setState(() {
    //       if (_counter > 0) {
    //         _counter--;
    //       } else {
    //         _timer.cancel();
    //       }
    //     });
    //   });
    // }

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
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/images/artwork.jpg',
                          fit: BoxFit.contain),
                      iconSize: width * 0.75,
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => ArtworkPage()));
                      },
                    ),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text(
                  //       hours.toString().padLeft(2, '0'),
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 34,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     // CustomTextContainer(
                  //     //     label: 'HRS', value: hours.toString().padLeft(2, '0')),
                  //     // CustomTextContainer(
                  //     //     label: 'MIN',
                  //     //     value: minutes.toString().padLeft(2, '0')),
                  //     // CustomTextContainer(
                  //     //     label: 'SEC',
                  //     //     value: seconds.toString().padLeft(2, '0')),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 20),
                  //   child: RaisedButton(
                  //     child: Text(isActive ? 'STOP' : 'START'),
                  //     onPressed: () {
                  //       setState(() {
                  //         isActive = !isActive;
                  //       });
                  //     },
                  //   ),
                  // ),
                  // _buildTimer(width, height),
                  // (_counter > 0)
                  //     ? Text("")
                  //     : Text(
                  //   "DONE!",
                  //   style: TextStyle(
                  //     color: Colors.green,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 48,
                  //   ),
                  // ),
                  // Text(
                  //   '$_counter',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 48,
                  //   ),
                  // ),
                  //
                  // // ignore: deprecated_member_use
                  // RaisedButton(
                  //   onPressed: () => _startTimer(),
                  //   child: Text("Start 10 second count down"),
                  // ),
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

    Future<DateTime> _currentTime() async {
      DateTime currentTime = await NTP.now();
      currentTime = currentTime.toUtc().add(const Duration(hours: 9));
      return currentTime;
    }
  }

/*
class CustomTextContainer extends StatelessWidget {
  CustomTextContainer({this.label, this.value});

  final String label;
  final String value;


  @override
  Widget build(BuildContext context) {
  return Container(
  margin: EdgeInsets.symmetric(horizontal: 5),
  padding: EdgeInsets.all(20),
  decoration: new BoxDecoration(
  borderRadius: new BorderRadius.circular(10),
  color: Colors.black87,
  ),
  child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
  Text(
  'value',
  style: TextStyle(
  color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
  ),
  Text(
  'label',
  style: TextStyle(
  color: Colors.white70,
  ),
  )
  ],
  ),
  );
  }
  }

 */
