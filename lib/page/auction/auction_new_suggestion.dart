import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../page/auction/auction_form_input.dart';
import '../../page/auction/auction_event.dart';
import '../../page/auction/auction_page.dart';

class NewSuggestion extends StatefulWidget {
  double width;
  double height;

  NewSuggestion({required this.width, required this.height});
  _NewSuggestion createState() => _NewSuggestion();
}

class _NewSuggestion extends State<NewSuggestion> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _total = TextEditingController();
  TextEditingController _ratio = TextEditingController();

  int userId = 0;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId') as int;
    });
  }

  String _price = '0';
  setPrice(String total, String ratio) => setState(() {
    _price = ((double.parse(total) * double.parse(ratio))/100).round().toString();
  });

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xffededed),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              '새로운 제안',
              style: TextStyle(
                fontSize: widget.height * 0.022,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.02),
            ),
            SuggestTextField(width: widget.width, height: widget.height, label: '합산 금액', change: _total, fixed: _ratio, funcNo: 1, setter: setPrice),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.015),
            ),
            SuggestTextField(width: widget.width, height: widget.height, label: '희망 지분', change: _ratio, fixed: _total, funcNo: 2, setter: setPrice),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.015),
            ),
            Container(
              width: widget.width * 0.8,
              alignment: Alignment.bottomRight,
              child: Text(
                '예상 지불 금액: ${_price} KLAY',
                style: TextStyle(
                  fontSize: widget.height * 0.015,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.015),
            ),
            TextButton(
              onPressed: () async { // 제안 기능 구현 필요
                if (formKey.currentState!.validate()) {
                  SendToServer().suggestNewAuction(
                      userId, int.parse(_total.text.toString()),
                      double.parse(_ratio.text.toString()) / 100);
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          '제안 완료',
                          style: TextStyle(
                            fontSize: widget.height * 0.02,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                '경매 현황: ${double.parse(_price).round()} KLAY / ${_total.text} KLAY',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuctionPage()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
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
            ),
          ],
        ),
      )
    );
  }
}