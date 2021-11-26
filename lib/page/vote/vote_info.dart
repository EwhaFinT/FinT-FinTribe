import 'package:fint/model/vote_proposal.dart';
import 'package:flutter/cupertino.dart';

class VoteInfo extends StatefulWidget {
  double width;
  double height;
  String content;
  String suggester;
  int price;

  VoteInfo({required this.width, required this.height, required this.content, required this.suggester, required this.price});
  _VoteInfo createState() => _VoteInfo();
}

class _VoteInfo extends State<VoteInfo> {

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: widget.width * 0.3,
              child: Text(
                '투표 내용',
                style: TextStyle(fontSize: widget.height * 0.02),
              ),
            ),
            Container(
              width: widget.width * 0.5,
              child: Text(
                widget.content,
                style: TextStyle(fontSize: widget.height * 0.02),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              width: widget.width * 0.3,
              child: Text(
                '제안자',
                style: TextStyle(fontSize: widget.height * 0.02),
              ),
            ),
            Container(
              width: widget.width * 0.5,
              child: Text(
                widget.content,
                style: TextStyle(fontSize: widget.height * 0.02),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              width: widget.width * 0.3,
              child: Text(
                '낙찰 가격',
                style: TextStyle(fontSize: widget.height * 0.02),
              ),
            ),
            Container(
              width: widget.width * 0.5,
              child: Text(
                widget.price.toString(),
                style: TextStyle(fontSize: widget.height * 0.02),
              ),
            ),
          ],
        ),
      ],
    );
  }
}