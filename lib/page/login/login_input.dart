import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  double width;
  double height;
  String label;
  bool visible;
  TextEditingController controller;

  LoginTextField({required this.width, required this.height, required this.label, required this.visible, required this.controller});
  _LoginTextField createState() => _LoginTextField();
}

class _LoginTextField extends State<LoginTextField> {
  Widget build(BuildContext context) {
    return Row(
        children: <Widget> [
          Container(
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
              padding: EdgeInsets.all(widget.width * 0.04)
          ),
          Expanded(
            child: Container(
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
              ),
            ),
          ),
        ]
    );
  }
}