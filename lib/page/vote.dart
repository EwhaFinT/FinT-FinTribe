import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../model/vote_rate.dart';

enum SelectVote { YES, NO }

class VotePage extends StatefulWidget {
  // 투표 정보 받아와야 함
  /*
  String voteContent;
  String suggester;
  int existingPrice;
  int suggestedPrice;
  String auctionDate;
  String voteDate;
  // 그림 파일
  */
  _VotePage createState() => _VotePage();
}

class _VotePage extends State<VotePage> {

  SelectVote? _vote = SelectVote.YES;

  static List<charts.Series<VoteRate, String>> _createSampleData() {
    final _data = [
      new VoteRate(label: 'YES', rate: 62.0),
      new VoteRate(label: 'NO', rate: 30.0),
    ];

    return [
      new charts.Series<VoteRate, String>(
        id: '',
        domainFn: (VoteRate rate, _) => rate.label,
        measureFn: (VoteRate rate, _) => rate.rate,
        data: _data,
      ),
    ];
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
                Column(
                    children: <Widget> [
                      _buildHeader(width, height),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.04),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: const Color(0xffededed),
                        ),
                        child: Column(
                          children: [
                            _buildVoteInfo(width, height),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildVoteResult(width, height, _createSampleData()),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.04),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: const Color(0xffededed),
                        ),
                        child: _buildVote(width, height),
                      ),
                    ]
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width, double height) {
    // 첫번째 컨테이너: 작품 정보
    // 두번째 컨테이너: 작품(.jpeg / .png )
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Container(
            width: width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text(
                  'Voting',
                  style: TextStyle(
                      fontSize: height * 0.028,
                      fontWeight: FontWeight.bold
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
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.015),
        ),
        Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          width: width * 0.35,
        ),
      ],
    );
  }

  Widget _buildVoteInfo(double width, double height) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: width * 0.3,
              child: Text(
                '투표 내용',
                style: TextStyle(fontSize: height * 0.02),
              ),
            ),
            Container(
              width: width * 0.5,
              child: Text(
                '~~~~',
                style: TextStyle(fontSize: height * 0.02),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              width: width * 0.3,
              child: Text(
                '제안자',
                style: TextStyle(fontSize: height * 0.02),
              ),
            ),
            Container(
              width: width * 0.5,
              child: Text(
                '~~~~',
                style: TextStyle(fontSize: height * 0.02),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              width: width * 0.3,
              child: Text(
                '낙찰 가격',
                style: TextStyle(fontSize: height * 0.02),
              ),
            ),
            Container(
              width: width * 0.5,
              child: Text(
                '~~~~',
                style: TextStyle(fontSize: height * 0.02),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVoteResult(double width, double height, List<charts.Series<dynamic, String>> _data) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffededed),
      ),
      child: Expanded(
        child: Column(
          children: [
            Text(
              'Voting Result',
              style: TextStyle(
                  fontSize: height * 0.024,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.01,
                  width * 0.0005,
                  width * 0.01,
                  width * 0.0005,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Column(
                  children: <Widget> [
                    Text('YES'),
                    Padding(
                      padding: EdgeInsets.all(width * 0.01),
                    ),
                    Text(
                      '60%',
                      style: TextStyle(
                          fontSize: height * 0.024,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.1),
                ),
                Column(
                  children: <Widget> [
                    Text('NO'),
                    Padding(
                      padding: EdgeInsets.all(width * 0.01),
                    ),
                    Text(
                      '20%',
                      style: TextStyle(
                          fontSize: height * 0.024,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ]
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVote(double width, double height) {
    return Expanded(
        child: Column(
        children: <Widget> [
          Text(
            '현재 나의 지분 ',
            style: TextStyle(
              fontSize: height * 0.024,
            ),
          ),
          Text(
            '105 / 200 KLAY',
            style: TextStyle(
              fontSize: height * 0.02,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(width * 0.05, width * 0.01, width * 0.05, width * 0.01 ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: const Color(0xffd6d6d6),
            ),
            child: Expanded(
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: Column(
                      children: <Widget> [
                        ListTile(
                          title: const Text('YES'),
                          leading: Radio<SelectVote>(
                            value: SelectVote.YES,
                            groupValue: _vote,
                            onChanged: (SelectVote? value) {
                              setState(() {
                                _vote = value;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                        ),
                        ListTile(
                          title: const Text('NO'),
                          leading: Radio<SelectVote>(
                            value: SelectVote.NO,
                            groupValue: _vote,
                            onChanged: (SelectVote? value) {
                              setState(() {
                                _vote = value;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildVoteButton(width, height),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _buildVoteButton(double width, double height) {
    return TextButton(
      onPressed: () { // 투표 함수 기능 구현 필요

      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Ink(
        decoration: BoxDecoration(
            color: const Color(0xffc4c4c4),
        ),
        child: Container(
          width: width * 0.25,
          height: height * 0.1,
          alignment: Alignment.center,
          child: Text(
            'VOTE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}