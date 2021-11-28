import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../validate/create_vote_check.dart';

class CreateVoteTextField extends StatefulWidget {
  double width;
  double height;
  String label;
  TextEditingController controller;
  int funcNo;

  CreateVoteTextField({required this.width, required this.height, required this.label, required this.controller, required this.funcNo});
  _CreateVoteTextField createState() => _CreateVoteTextField();
}

class _CreateVoteTextField extends State<CreateVoteTextField> {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Container(
          width: widget.width * 0.2,
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: widget.height * 0.018,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(widget.width * 0.04),
        ),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            style: TextStyle(height: 0.8),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            validator: (value) { // 유효성 검사
              switch(widget.funcNo) {
                case 1: return CheckValidate().validateContent(value.toString());
                case 2: return CheckValidate().validatePrice(value.toString());
              }
            },
          ),
        ),
      ],
    );
  }
}