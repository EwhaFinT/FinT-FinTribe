import 'package:fint/page/community.dart';
import 'package:fint/page/upload/upload_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'vote/vote_page.dart';
import 'package:fint/page/wallet.dart';
import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class MyPage extends StatefulWidget {
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> {

  int userId = 0;
  String identity = "";

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId') as int;
      identity = prefs.getString('identity').toString();
    });
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
            padding: EdgeInsets.fromLTRB(width * 0.07, 30, width * 0.07, width * 0.07),
            children: <Widget> [
            Column(
              children: <Widget> [
                Row(
                children: <Widget>[
                  Container(
                    width: width * 0.15,
                    child: Image.asset('assets/images/circle.png', fit:BoxFit.contain),   //이미지 받아오는 기능으로 바꿔야함
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.01),
                  ),
                    Text(
                      identity,
                      style: TextStyle(
                          fontSize: height * 0.025,
                      ),
                    )
                  ]
                  ),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
              _buildMyWallet(width, height),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
                _buildPurchaseArtwork(width, height),
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                ),
                _buildUploadArtwork(width, height),
              ],
          ),
        ],
        ),
      ),
      ),
    );
}

  Widget _buildMyWallet(double width, double height) {
    return Container(
        padding: EdgeInsets.fromLTRB(width * 0.04, width * 0.04, width * 0.04, 5),

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: const Color(0xffededed),
        ),
      child: Column(
        children: <Widget>[
          Container(
            width: width * 0.75,
            child: Text(
              'My wallet',
              style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WalletPage()));
            }, //응답 받아와서 넣기
            child: Text("연동 바로가기"),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityButton(double width, double height) {
    return TextButton(
      onPressed: () { // 커뮤니티 이동
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CommunityPage()));
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xffc4c4c4),
        ),
        child: Container(
          width: width * 0.35,
          height: height * 0.05,
          alignment: Alignment.center,
          child: Text(
            'community',
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVotingButton(double width, double height) {
    return TextButton(
      onPressed: () { // 투표 창으로 이동
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => VotePage()));
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xffc4c4c4),
        ),
        child: Container(
          width: width * 0.35,
          height: height * 0.05,
          alignment: Alignment.center,
          child: Text(
            'Voting',
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPurchaseArtwork(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: const Color(0xffededed),
      ),
      child: Column(
        children: <Widget>[
          Text(
            '구매한 작품',
            style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          Image.asset('assets/images/artwork.jpg'),    //작품 받아와서 넣기
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          Container(
            child: Row(
              children: <Widget>[
                _buildCommunityButton(width, height),
                _buildVotingButton(width, height),
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _buildUploadArtwork(double width, double height) {
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.04, 1, width * 0.04, 1),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: const Color(0xffededed),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: width * 0.75,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => UploadPage()));
                  }, //업로드 페이지로 이동
                  child: Text("내 작품 업로드 하기"),
                ),
          ),

        ],
      ),
    );
  }

}