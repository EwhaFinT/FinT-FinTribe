import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../page/vote/vote_button.dart';
enum SelectVote { YES, NO }

class VoteForm extends StatefulWidget {
  double width;
  double height;
  int myPrice;
  int totalPrice;
  double myRatio;

  VoteForm({required this.width, required this.height, required this.myPrice, required this.totalPrice, required this.myRatio});
  _VoteForm createState() => _VoteForm();
}

class _VoteForm extends State<VoteForm> {
  SelectVote? _vote = SelectVote.YES;

  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: <Widget> [
            Text(
              '현재 나의 지분 ',
              style: TextStyle(
                fontSize: widget.height * 0.024,
              ),
            ),
            Text(
              '${widget.myPrice} / ${widget.totalPrice} KLAY',
              style: TextStyle(
                fontSize: widget.height * 0.02,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(widget.width * 0.015),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(widget.width * 0.01, widget.width * 0.005, widget.width * 0.01, widget.width * 0.005 ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: const Color(0xffd6d6d6),
              ),
              child: Expanded(
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: Column(
                        children: <Widget> [
                          ListTile(
                            title: const Text(
                              'YES',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            leading: Radio<SelectVote>(
                              value: SelectVote.YES,
                              groupValue: _vote,
                              onChanged: (SelectVote? value) {
                                setState(() {
                                  _vote = value;
                                });
                              },
                              activeColor: Colors.black,
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'NO',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            leading: Radio<SelectVote>(
                              value: SelectVote.NO,
                              groupValue: _vote,
                              onChanged: (SelectVote? value) {
                                setState(() {
                                  _vote = value;
                                });
                              },
                              activeColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VoteButton(width: widget.width, height: widget.height, choice: (_vote == SelectVote.YES) ? true:false, myRatio: widget.myRatio),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}