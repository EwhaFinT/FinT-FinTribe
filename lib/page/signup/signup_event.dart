import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/user_signup.dart';
import 'package:fint/domain.dart';

class SendToServer { // 서버와 통신
  Future<int> signup(String id, String pw, String name, String phoneNumber) async {
    UserSignup user = new UserSignup(
        id: id,
        pw: pw,
        name: name,
        phoneNumber: phoneNumber
    );

    String addr = domain + "/v1/user"; // 서버 주소
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

    // 회원가입 성공 여부 받아오기
    if(response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['duplicate'];
    }
    throw Exception();
  }
}