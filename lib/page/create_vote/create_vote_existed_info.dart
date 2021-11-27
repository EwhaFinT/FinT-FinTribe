import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateVoteExistedInfo extends StatefulWidget {
  double width;
  double height;
  String label;
  String content;

  CreateVoteExistedInfo({required this.width, required this.height, required this.label, required this.content});
  _CreateVoteExistedInfo createState() => _CreateVoteExistedInfo();
}

class _CreateVoteExistedInfo extends State<CreateVoteExistedInfo> {

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
        Text(
          widget.content,
          style: TextStyle(
            fontSize: widget.height * 0.018,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}