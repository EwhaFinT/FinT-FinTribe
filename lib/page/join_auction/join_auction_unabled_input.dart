import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuctionJoinUnabledTextField extends StatefulWidget {
  double width;
  double height;
  String label;
  String initial;

  AuctionJoinUnabledTextField({required this.width, required this.height, required this.label, required this.initial});
  _AuctionJoinUnabledTextField createState() => _AuctionJoinUnabledTextField();
}

class _AuctionJoinUnabledTextField extends State<AuctionJoinUnabledTextField> {
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
            enabled: false,
            initialValue: widget.initial,
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