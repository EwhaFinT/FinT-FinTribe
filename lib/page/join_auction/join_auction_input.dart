import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../validate/join_auction_check.dart';

class AuctionJoinTextField extends StatefulWidget {
  double width;
  double height;
  String label;
  double remainRatio;
  TextEditingController controller;
  int total;
  Function setter;

  AuctionJoinTextField({required this.width, required this.height, required this.label, required this.remainRatio, required this.controller, required this.total, required this.setter});
  _AuctionJoinTextField createState() => _AuctionJoinTextField();
}

class _AuctionJoinTextField extends State<AuctionJoinTextField> {
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
            validator: (value) {
              String? result = CheckValidate().validateRatio(value.toString(), widget.remainRatio);
              if(result == null) widget.setter(widget.total, value.toString());
              return result;
            },
          ),
        ),
      ],
    );
  }
}