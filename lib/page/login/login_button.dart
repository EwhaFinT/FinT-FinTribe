import 'package:fint/page/login/login_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  GlobalKey<FormState> formKey;
  double width;
  double height;
  TextEditingController id;
  TextEditingController pw;

  LoginButton({required this.formKey, required this.width, required this.height, required this.id, required this.pw});
  _LoginButton createState() => _LoginButton();
}

class _LoginButton extends State<LoginButton> {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(widget.formKey.currentState!.validate()) {
          SendToServer().login(widget.id.text, widget.pw.text);
        }
      },
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: widget.height * 0.024,
            fontWeight: FontWeight.bold,
            color: const Color(0xffACB6E5)
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.white.withOpacity(0.8),
          padding: EdgeInsets.fromLTRB(widget.width * 0.1, widget.width * 0.04, widget.width * 0.1, widget.width * 0.04)
      ),
    );
  }
}