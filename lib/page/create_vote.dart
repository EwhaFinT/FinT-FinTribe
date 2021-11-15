import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/button.dart';

class CreateVotePage extends StatefulWidget {
  // 작품 정보 받아와야 함
  /*
  String artworkName;
  String artist;
  int price;
  // 그림 파일
  */
  _CreateVotePage createState() => _CreateVotePage();
}

class _CreateVotePage extends State<CreateVotePage> {
  DateTime today = DateTime.now();
  DateTime voteDate = DateTime.now();
  DateTime auctionDate = DateTime.now();

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
                      child: Column(
                        children: [
                          _buildArtworkInfo(width, height),
                          Padding(
                            padding: EdgeInsets.all(width * 0.02),
                          ),
                          _buildTextField(width, height, '투표 내용'), // 1. 투표 내용
                          Padding(
                            padding: EdgeInsets.all(width * 0.02),
                          ),
                          _buildExistedContents(width, height, '제안자'), // 2. 제안자
                          Padding(
                            padding: EdgeInsets.all(width * 0.02),
                          ),
                          _buildExistedContents(width, height, '판매 제안 일시'), // 3. 판매 제안 일시
                          Padding(
                            padding: EdgeInsets.all(width * 0.02),
                          ),
                          _buildTextField(width, height, '판매 제안가'), // 4. 판매 제안가
                          Padding(
                            padding: EdgeInsets.all(width * 0.02),
                          ),
                          _buildDatePicker(width, height, '투표 기한', voteDate), // 5. 투표 기한
                          Padding(
                            padding: EdgeInsets.all(width * 0.02),
                          ),
                          _buildDatePicker(width, height, '낙찰 기한', auctionDate), // 6. 낙찰 기한
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                    ),
                    GradientButton(buttonName: 'SUGGEST', func: (){}),
                  ]
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildArtworkInfo(double width, double height) {
    // 첫번째 컨테이너: 작품(.jpeg / .png )
    // 두번째 컨테이너: 작품 정보

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Container(
          width: width * 0.3,
          height: width * 0.3,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.015),
        ),
        Container(
          width: width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '작품 정보',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\n작품명: ',
                style: TextStyle(fontSize: height * 0.018),
              ),
              Text(
                '작가: ',
                style: TextStyle(fontSize: height * 0.018),
              ),
              Text(
                '낙찰 가격: ',
                style: TextStyle(fontSize: height * 0.018),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildExistedContents(double width, double height, String label) {
    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.018,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Text(
          '~~~~',
        ),
      ],
    );
  }

  Widget _buildDatePicker(double width, double height, String label, DateTime date) {
    String _date = DateFormat('yyyy-MM-dd').format(date);

    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.018,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Text(
            _date,
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.06),
        ),
        ElevatedButton(
          onPressed: () {
            final DateTime selectedDate = showDatePicker(
              context: context,
              initialDate: today, // 초깃값
              firstDate: today,
              lastDate: today,
            ) as DateTime;
            if (selectedDate != null) {
              setState(() {
                date = selectedDate as DateTime;
              });
            }
          },
          child: Text(
            'Pick Date',
            style: TextStyle(
              color: Colors.black,
              fontSize: height * 0.018,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white.withOpacity(0.9),
              padding: EdgeInsets.fromLTRB(width * 0.02, width * 0.02, width * 0.02, width * 0.02)
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(double width, double height, String label) {
    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.018,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Expanded(
          child: TextField(
            style: TextStyle(height: 0.8),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}