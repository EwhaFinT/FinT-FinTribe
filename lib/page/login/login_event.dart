import 'dart:convert';

import 'package:fint/model/user_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendToServer {
  Future<void> login(String id, String pw) async {
    UserLogin user = new UserLogin(
      id: id,
      pw: pw,
    );

    print(user.id + ' ' + user.pw);
    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

    // 아이디, 비밀번호 보내기
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String> {
            'identity': user.id,
            'password': user.pw,
          }
      ),
    );

    // 로그인 성공 여부 받아오기
    if(response.statusCode == 200) return json.decode(response.body);
    throw Exception();
    */
  }
}