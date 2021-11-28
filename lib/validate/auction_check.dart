import 'package:flutter/cupertino.dart';

class CheckValidate { // 유효성 검사 함수
  String? validatePrice(String value) {
    RegExp regExp = new RegExp(r'^[0-9]+$');
    if(!regExp.hasMatch(value)) return '숫자만 입력하세요.';
    return null;
  }

  String? validateRatio(String value) {
    RegExp regExp = new RegExp(r'^[0-9]+$');
    if(!regExp.hasMatch(value)) return '숫자만 입력하세요.';
    else {
      double ratio = double.parse(value.toString());
      if(ratio <= 0 || ratio > 100) return '1이상 100 이하의 숫자';
      return null;
    }
  }
}