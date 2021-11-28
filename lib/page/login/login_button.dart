import 'package:fint/page/login/login_event.dart';
import 'package:fint/page/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      onPressed: () async {
        int result = 0;
        if(widget.formKey.currentState!.validate()) {
          result = await SendToServer().login(widget.id.text, widget.pw.text);

          if(result >= 1) {
            // 아이디 저장
            final prefs = await SharedPreferences.getInstance();
            prefs.setString('identity', widget.id.text);
            prefs.setInt('userId', result);

            // 로그인 성공 후 메인 페이지로
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage()
                )
            );
          }
          else {
            return showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    '로그인 실패',
                    style: TextStyle(
                      fontSize: widget.height * 0.02,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                          '아이디나 비밀번호가 일치하지 않습니다.',
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