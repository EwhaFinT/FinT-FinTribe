import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../page/join_auction/join_auction_input.dart';
import '../../page/join_auction/join_auction_unabled_input.dart';
import '../../page/join_auction/join_auction_event.dart';
import '../../page/auction/auction_page.dart';

class AuctionForm extends StatefulWidget {
  double width;
  double height;
  int total;
  double remainRatio;

  AuctionForm({required this.width, required this.height, required this.total, required this.remainRatio});
  _AuctionForm createState() => _AuctionForm();
}

class _AuctionForm extends State<AuctionForm> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _ratio = new TextEditingController();

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
  setPrice(int total, String ratio) => setState(() {
    _price = ((total * double.parse(ratio))/100).round().toString();
  });

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffededed),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AuctionJoinUnabledTextField(width: widget.width, height: widget.height, label: '합산 금액', initial: widget.total.toString()),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.035),
            ),
            AuctionJoinUnabledTextField(width: widget.width, height: widget.height, label: '잔여 지분', initial: (widget.remainRatio*100).toString()),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.01),
            ),
            Container(
              width: widget.width * 0.8,
              alignment: Alignment.bottomRight,
              child: Text(
                '잔여 금액: ${widget.total * widget.remainRatio} KLAY',
                style: TextStyle(
                  fontSize: widget.height * 0.015,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.015),
            ),
            AuctionJoinTextField(width: widget.width, height: widget.height, label: '희망 지분', remainRatio: (widget.remainRatio*100), controller: _ratio, total: widget.total,setter: setPrice),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.01),
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
              onPressed: () async {
                if(formKey.currentState!.validate()) {
                  SendToServer().joinAuction(
                      1, userId, 1, double.parse(_ratio.text) / 100);
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          '경매 완료',
                          style: TextStyle(
                            fontSize: widget.height * 0.02,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                '경매 참여 완료! ${double.parse(_ratio.text) / 100 * widget.total} KLAY 인출 되었습니다.\n경매 현황: ${(1-(widget.remainRatio - double.parse(_ratio.text) / 100)) * widget.total} KLAY / ${widget.total} KLAY',
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
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuctionPage()),
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
                    '참여하기',
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