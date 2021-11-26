import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../page/vote/vote_event.dart';

class VoteButton extends StatefulWidget{
  double width;
  double height;
  bool choice;
  double myRatio;

  VoteButton({required this.width, required this.height, required this.choice, required this.myRatio});
  _VoteButton createState() => _VoteButton();
}

class _VoteButton extends State<VoteButton> {
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { // 투표 함수 기능 구현 필요
        SendToServer().submitVote(1, DateTime.now(), widget.choice, widget.myRatio);
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xffc4c4c4),
        ),
        child: Container(
          width: widget.width * 0.25,
          height: widget.height * 0.1,
          alignment: Alignment.center,
          child: Text(
            'VOTE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}