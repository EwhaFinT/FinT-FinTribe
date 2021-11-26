import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../page/auction/auction_event.dart';

class SuggestButton extends StatefulWidget {
  GlobalKey<FormState> formKey;
  double width;
  double height;
  int totalPrice;
  double ratio;

  SuggestButton({required this.formKey, required this.width, required this.height, required this.totalPrice, required this.ratio});
  _SuggestButton createState() => _SuggestButton();
}

class _SuggestButton extends State<SuggestButton> {
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { // 제안 기능 구현 필요
        if(widget.formKey.currentState!.validate())
          SendToServer().suggestNewAuction(widget.totalPrice, widget.ratio);
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xffc4c4c4),
        ),
        child: Container(
          width: widget.width * 0.2,
          height: widget.height * 0.05,
          alignment: Alignment.center,
          child: Text(
            '제안하기',
            style: TextStyle(
              fontSize: widget.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}