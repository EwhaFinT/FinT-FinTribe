import 'package:flutter/cupertino.dart';

class VoteResult extends StatefulWidget {
  double width;
  double height;
  double yes;
  double no;

  VoteResult({required this.width, required this.height, required this.yes, required this.no});
  _VoteResult createState() => _VoteResult();
}

class _VoteResult extends State<VoteResult> {

  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(widget.width * 0.02),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffededed),
      ),
      child: Expanded(
        child: Column(
          children: [
            Text(
              'Voting Result',
              style: TextStyle(
                  fontSize: widget.height * 0.024,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(widget.width * 0.01, 0, widget.width * 0.01, 0),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      Text('YES'),
                      Padding(
                        padding: EdgeInsets.all(widget.width * 0.01),
                      ),
                      Text(
                        '${widget.yes*100} %',
                        style: TextStyle(
                            fontSize: widget.height * 0.024,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(widget.width * 0.1),
                  ),
                  Column(
                    children: <Widget> [
                      Text('NO'),
                      Padding(
                        padding: EdgeInsets.all(widget.width * 0.01),
                      ),
                      Text(
                        '${widget.no*100} %',
                        style: TextStyle(
                            fontSize: widget.height * 0.024,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }
}