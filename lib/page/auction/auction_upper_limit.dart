import 'package:flutter/cupertino.dart';

class UpperLimit extends StatefulWidget {
  double width;
  double height;
  int upperLimit;

  UpperLimit({required this.width, required this.height, required this.upperLimit});
  _UpperLimit createState() => _UpperLimit();
}

class _UpperLimit extends State<UpperLimit> {
  Widget build (BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffededed),
      ),
      child: Row(
        children: [
          Text(
            '현재 상한가',
            style: TextStyle(
              fontSize: widget.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(widget.width * 0.02, widget.width * 0.02, widget.width * 0.1, widget.width * 0.02),
          ),
          Text(
            '${widget.upperLimit} KLAY',
            style: TextStyle(
              fontSize: widget.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}