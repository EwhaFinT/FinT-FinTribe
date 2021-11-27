import 'package:fint/page/vote/vote_artwork_info.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:ntp/ntp.dart';
import 'package:intl/intl.dart';
//import 'package:timer_builder/timer_builder.dart';
import 'package:duration/duration.dart';

import '../artwork.dart';
import '../../model/artwork.dart';
import '../../page/main/main_event.dart';
import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin{

  int artId = 0;
  String artist = '';
  String title = '';
  String detail = '';
  String nftAddress = '';
  int price = 0;

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
    super.initState();
    tb = TabController(
      length: 2,

      vsync: this,
    );
    _loadArtworkInfo();
  }

  _loadArtworkInfo() async {
    Artwork artwork = await ReceiveFromServer().loadArtworkInfo();
    DateTime now = DateTime.now();
    var formatter = DateFormat('HH-mm-ss');

    setState(() {
      artId = artwork.artId;
      artist = artwork.artist;
      title = artwork.title;
      detail = artwork.detail;
      nftAddress = artwork.nftAddress;
      price = artwork.price;

      // 남은 시간 계산
      String _now = formatter.format(now);
      List<String> _now_divide = _now.split('-');
      String endTime = artwork.time.toString();

      hour = int.parse(endTime.substring(0,2)) - int.parse(_now_divide[0]);
      min = int.parse(endTime.substring(2, 2)) - int.parse(_now_divide[1]);
      sec = int.parse(endTime.substring(4, 2)) - int.parse(_now_divide[2]);
      print("${hour}:${min}:${sec}");
      if (started) {
        start();
      }
    });
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
                  title, //제목 받아와야함
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
                    artist, //작가명 받아와야함
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
                          ArtworkPage(
                            artworkInfo: new Artwork(
                                artId: artId,
                                artist: artist,
                                title: title,
                                detail: detail,
                                nftAddress: nftAddress,
                                price: price,
                                time: hour * 10000 + min * 100 + sec,
                              ),
                          )));
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