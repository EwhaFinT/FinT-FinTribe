import 'package:flutter/cupertino.dart';

class CheckValidate { // 유효성 검사 함수
  String? validateRatio(String value, double cmp) {
    RegExp regExp = new RegExp(r'^[0-9]+$');
    if(!regExp.hasMatch(value)) return '숫자만 입력하세요.';
    else {
      double ratio = double.parse(value.toString());
      if(ratio <= 0 || ratio > cmp) return '1이상 ${cmp} 이하의 숫자';
      return null;
    }
  }
}