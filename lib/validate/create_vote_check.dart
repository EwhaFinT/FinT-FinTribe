import 'package:flutter/cupertino.dart';

class CheckValidate { // 유효성 검사 함수
  // 투표 내용
  String? validateContent(String value) {
    if(value.isEmpty) return '내용을 입력하세요.';
    return null;
  }
  // 가격 유효성 검사 (반드시 숫자)
  String? validatePrice(String value) {
    if(value.isEmpty) return '가격을 입력하세요.';
    else {
      RegExp regExp = new RegExp(r'^[0-9]+$');
      if(!regExp.hasMatch(value)) return '숫자만 입력하세요.';
      else return null;
    }
  }

  // 날짜 유효성 검사
  String? validateDate(String value) {
    if(value.isEmpty) return '비밀번호를 입력하세요.';
    else {
      RegExp regExp = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
      if(!regExp.hasMatch(value)) return '대소문자, 숫자 포함 6자 이상';
      else return null;
    }
  }
}