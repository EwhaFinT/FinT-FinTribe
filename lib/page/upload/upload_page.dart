import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../widget/button.dart';
import '../../page/upload/upload_date_picker.dart';

var formatter = new DateFormat('yyyy-MM-dd');

class UploadPage extends StatefulWidget {
  // 경매 정보 받아와야 함
  _UploadPage createState() => _UploadPage();
}

class _UploadPage extends State<UploadPage> {

  DateTime today = DateTime.now();
  DateTime auctionDate = DateTime.now();
  io.File? _image;


  String _auctionDate = formatter.format(DateTime.now()).toString();
  setAuctionDate(String value) => setState(() {
    _auctionDate = value;
  });

  final TextEditingController title = TextEditingController();
  final TextEditingController artist = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController detail = TextEditingController();

  _uploadImage() async {
    XFile? f = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = f as io.File?;
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
          GestureDetector(
            onTap: () {
              _uploadImage();
            },
            child: Container(
              width: width * 0.7,
              height: width * 0.7,
              padding: EdgeInsets.all(width * 0.04),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: const Color(0xffededed),
              ),
              child: _image == null
                ? Text('No image selected.') : Image.file(_image as io.File, width: 100, height: 100),
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
          UploadDatePicker(width: width, height: height, label: '낙찰 기한', controller: _auctionDate, start: today, date: auctionDate, setter: setAuctionDate),
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
}