import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../validate/auction_check.dart';

class SuggestTextField extends StatefulWidget {
  double width;
  double height;
  String label;
  TextEditingController change;
  TextEditingController fixed;
  int funcNo;
  Function setter;

  SuggestTextField({required this.width, required this.height, required this.label, required this.change, required this.fixed, required this.funcNo, required this.setter});
  _SuggestTextField createState() => _SuggestTextField();
}

class _SuggestTextField extends State<SuggestTextField> {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Container(
          width: widget.width * 0.2,
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: widget.height * 0.019,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(widget.width * 0.04),
        ),
        Expanded(
          child: TextFormField(
            controller: widget.change,
            style: TextStyle(height: 0.8),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            validator: (value) { // 유효성 검사
              String? result;
              switch(widget.funcNo) {
                case 1: result = CheckValidate().validatePrice(value.toString()); break;
                case 2: result = CheckValidate().validateRatio(value.toString()); break;
              }
              if(result == null) widget.setter(widget.change.text, widget.fixed.text);
              return result;
            },
          ),
        ),
      ],
    );
  }
}