import 'dart:convert';

import 'package:fint/model/user_login.dart';

import 'package:http/http.dart' as http;
import 'package:fint/domain.dart';

class SendToServer {
  Future<int> login(String id, String pw) async {
    UserLogin user = new UserLogin(
      id: id,
      pw: pw,
    );

    String addr = domain + "/v1/identity"; // 서버 주소

    Map<String, String> queryParams = {
      'identity': user.id,
      'password': user.pw,
    };

    // 아이디, 비밀번호 보내기
    final response = await http.get(
      Uri.parse(addr).replace(queryParameters: queryParams),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
    );

    // 로그인 성공 여부 받아오기
    if(response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['userId'];
    }
    throw Exception();
  }
}