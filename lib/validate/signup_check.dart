import 'package:flutter/cupertino.dart';

class CheckValidate { // 유효성 검사 함수
  // 아이디 유효성 검사
  String? validateId(String value) {
    if(value.isEmpty) return '아이디를 입력하세요.';
    else if(value.length < 5) return '5자 이상 입력하세요.';
    return null;
  }

  // 비밀번호 유효성 검사
  String? validatePassword(String value) {
    if(value.isEmpty) return '비밀번호를 입력하세요.';
    else {
      RegExp regExp = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
      if(!regExp.hasMatch(value)) return '대소문자, 숫자 포함 6자 이상';
      else return null;
    }
  }

  // 비밀번호 확인 유효성 검사
  String? validateConfirmPassword(String password, String value) {
    if(value != password) return '비밀번호가 일치하지 않습니다';
    return null;
  }

  // 이름 유효성 검사
  String? validateName(String value) {
    if(value.isEmpty) return '이름을 입력하세요.';
    else if(value.length < 3) return '3자 이상 입력하세요.';
    return null;
  }

  // 전화번호 유효성 검사
  String? validatePhoneNumber(String value) {
    if(value.isEmpty) return '전화번호를 입력하세요.';
    else {
      RegExp regExp = new RegExp(r'^\d{3}-\d{3,4}-\d{4}$/');
      if(!regExp.hasMatch(value)) return '하이픈(-)을 포함해주세요.';
      else return null;
    }
  }
}