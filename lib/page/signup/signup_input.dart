import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fint/validate/signup_check.dart';

class SignupTextField extends StatefulWidget {
  double width;
  double height;
  String label;
  TextEditingController pw;
  bool visible;
  TextEditingController controller;
  int funcNo;

  SignupTextField({required this.width, required this.height, required this.label, required this.pw, required this.visible, required this.controller, required this.funcNo});
  _SignupTextField createState() => _SignupTextField();
}

class _SignupTextField extends State<SignupTextField> {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Container( // 라벨
          width: widget.width * 0.18,
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: widget.height * 0.02,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(widget.width * 0.04),
        ),
        Expanded( // 텍스트 입력창
          child: TextFormField(
            obscureText: !widget.visible,
            controller: widget.controller,
            style: TextStyle(height: 1.0),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),

            validator: (value) { // 유효성 검사
              switch(widget.funcNo) {
                case 1: return CheckValidate().validateId(value.toString());
                case 2: return CheckValidate().validatePassword(value.toString());
                case 3: return CheckValidate().validateConfirmPassword(widget.pw.text, value.toString());
                case 4: return CheckValidate().validateName(value.toString());
                case 5: return null;//CheckValidate().validatePhoneNumber(value.toString());
              }
            },
          ),
        ),
      ],
    );
  }
}