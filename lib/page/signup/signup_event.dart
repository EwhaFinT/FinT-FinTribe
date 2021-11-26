import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/user_signup.dart';

class SendToServer { // 서버와 통신
  void signup(String id, String pw, String name, String phoneNumber) {
    UserSignup user = new UserSignup(
        id: id,
        pw: pw,
        name: name,
        phoneNumber: phoneNumber
    );

    // 결과 확인용
    print(user.id + ' ' + user.pw + ' ' + user.name + ' ' + user.phoneNumber);

    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String> {
            'identity': user.id,
            'password': user.pw,
            'name': user.name,
            'phone': user.phoneNumber,
          }
      ),
    );
    */
  }
}