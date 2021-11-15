import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  String buttonName; // 버튼명
  VoidCallback func; // 버튼 클릭시 작동하는 함수

  GradientButton({required this.buttonName, required this.func});
  _GradientButton createState() => _GradientButton();
}

class _GradientButton extends State<GradientButton> {
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.func;
      },
      style: TextButton.styleFrom( primary: Colors.white),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xffACB6E5), Color(0xff86FDE8)]),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          width: 200,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.buttonName,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}