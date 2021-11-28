import 'package:fint/page/signup/signup_event.dart';
import 'package:fint/page/signup/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fint/page/login/login_page.dart';

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
      onPressed: () async {
        int result = 0;
        if(widget.formKey.currentState!.validate()) {
          result = await SendToServer().signup(widget.id.text, widget.pw.text, widget.name.text, widget.phoneNumber.text);

          // 중복 아이디 검사
          String isDuplicated = (result == 0) ? "dup" : "ok";
          print(isDuplicated);
          if(result == 1) {
            // 회원가입 성공 후 로그인 페이지로
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()
                )
            );
          }
          else {
            return showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    '회원가입 실패',
                    style: TextStyle(
                      fontSize: widget.height * 0.02,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                          '중복된 아이디 입니다.',
                          style: TextStyle(
                            fontSize: widget.height * 0.018,
                          ),
                        ),
                        Text(
                          '다른 아이디를 사용해주세요.',
                          style: TextStyle(
                            fontSize: widget.height * 0.018,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
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