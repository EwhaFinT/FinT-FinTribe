import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/button.dart';
import '../model/art.dart';

class SendToServer { // 서버와 통신
  Future<void> sendToServer(String title, String artist, int price, String detail, DateTime auctionDate) async {
    Art art = new Art(
      title: title,
      artist: artist,
      price: price,
      detail: detail,
      auctionDate: auctionDate
    );

    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'title': art.title,
            'artist': art.artist,
            'price': art.price,
            'detail': art.auctionDate,
          }
      ),
    );
  }
}


class UploadPage extends StatefulWidget {
  // 경매 정보 받아와야 함
  _UploadPage createState() => _UploadPage();
}

class _UploadPage extends State<UploadPage> {

  DateTime today = DateTime.now();
  DateTime auctionDate = DateTime.now();

  final TextEditingController title = TextEditingController();
  final TextEditingController artist = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController detail = TextEditingController();

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(
                    'Create New Item',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Image, Video, Audio, or 3D model',
                    style: TextStyle(
                      fontSize: height * 0.018,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                  ),
                  _buildUploadForm(width, height),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadForm(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(width * 0.04),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: const Color(0xffededed),
            ),
            child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              width: width * 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          _buildTextField(width, height, '작품명', title),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildTextField(width, height, '작가', artist),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildTextField(width, height, '경매 시작가', price),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildTextField(width, height, '작품 설명', detail),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
          ),
          _buildDatePicker(width, height, '낙찰 기한', auctionDate),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
          ),
          GradientButton(
              buttonName: 'CREATE',
              //func: () => SendToServer().sendToServer(title.text, artist.text, int.parse(detail.text), detail.text, auctionDate)
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(double width, double height, String label, TextEditingController _controller) {
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
          child: TextFormField(
            controller: _controller,
            style: TextStyle(height: 0.8),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffededed),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
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
}