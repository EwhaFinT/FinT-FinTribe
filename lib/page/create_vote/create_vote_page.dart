import 'package:fint/page/create_vote/create_vote_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../model/art.dart';
import '../../page/create_vote/create_vote_event.dart';
import '../../page/create_vote/create_vote_input.dart';
import '../../page/create_vote/create_vote_date_picker.dart';
import '../../page/create_vote/create_vote_art_info.dart';
import '../../page/create_vote/create_vote_existed_info.dart';

var formatter = new DateFormat('yyyy-MM-dd');

class CreateVotePage extends StatefulWidget {
  _CreateVotePage createState() => _CreateVotePage();
}

class _CreateVotePage extends State<CreateVotePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  DateTime today = DateTime.now();
  DateTime temp = DateTime.now();

  Future<Art>? artwork;
  String _voteDate = formatter.format(DateTime.now()).toString();
  String _auctionDate = formatter.format(DateTime.now()).toString();

  setVoteDate(String value) => setState(() {
    _voteDate = value;
  });
  setAuctionDate(String value) => setState(() {
    _auctionDate = value;
  });

  TextEditingController _content = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  void initState() {
    super.initState();
    artwork = ReceiveFromServer().loadArtInfo();
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
                    Container(
                        width: width * 0.9,
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
                      padding: EdgeInsets.all(width * 0.02),
                    ),
                    Container(
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: const Color(0xffededed),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CreateVoteArtInfo(width: width, height: height, artwork: artwork),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            CreateVoteTextField(width: width, height: height, label: '투표 내용', controller: _content, funcNo: 1), // 1. 투표 내용
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            // ==================== 사용자 아이디 받아오는 부분 작성 필요 ====================
                            CreateVoteExistedInfo(width: width, height: height, label: '제안자', content: '사용자 ID 불러오기 필요..'), // 2. 제안자
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            CreateVoteExistedInfo(width: width, height: height, label: '판매 제안 일시', content: formatter.format(today).toString()), // 3. 판매 제안 일시
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            CreateVoteTextField(width: width, height: height, label: '판매 제안가', controller: _price, funcNo: 2), // 4. 판매 제안가
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            CreateVoteDatePicker(width: width, height: height, label: '투표 기한', controller: _voteDate, start: today, date: temp, setter: setVoteDate), // 5. 투표 기한
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            CreateVoteDatePicker(width: width, height: height, label: '낙찰 기한', controller: _auctionDate, start: today, date: temp, setter: setAuctionDate), // 6. 낙찰 기한
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                    ),
                    TextButton(
                      onPressed: () => {
                        // 낙찰 기한은 투표 기한보다 길어야 함 & 텍스트 필드는 유효성을 만족해야 함
                        if(_voteDate.compareTo(_auctionDate) < 0 && formKey.currentState!.validate())
                          SendToServer().propose('사용자 ID', _content.text, formatter.format(today).toString(), _voteDate, _auctionDate, int.parse(_price.text))
                      },
                      style: TextButton.styleFrom( primary: Colors.white),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xffACB6E5), Color(0xff86FDE8)]),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'SUGGEST',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
              ),
            ]
          ),
        ),
      ),
    );
  }
}