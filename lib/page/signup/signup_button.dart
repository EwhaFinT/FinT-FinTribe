import 'package:fint/page/signup/signup_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
  GlobalKey<FormState> formKey;
  double width;
  double height;
  TextEditingController id;
  TextEditingController pw;
  TextEditingController name;
  TextEditingController phoneNumber;

  SignupButton({required this.formKey, required this.width, required this.height, required this.id, required this.pw, required this.name, required this.phoneNumber});
  _SignupButton createState() => _SignupButton();
}

class _SignupButton extends State<SignupButton> {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(widget.formKey.currentState!.validate())
          SendToServer().signup(widget.id.text, widget.pw.text, widget.name.text, widget.phoneNumber.text);
      },
      child: Text(
        'Create Account',
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