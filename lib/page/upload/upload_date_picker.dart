import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UploadDatePicker extends StatefulWidget {
  double width;
  double height;
  String label;
  String controller;
  DateTime start;
  DateTime date;
  Function setter;

  UploadDatePicker({required this.width, required this.height, required this.label, required this.controller, required this.start, required this.date, required this.setter});
  _UploadDatePicker createState() => _UploadDatePicker();
}

class _UploadDatePicker extends State<UploadDatePicker> {
  Widget build(BuildContext context) {
    var formatter = DateFormat('yyyy-MM-dd');
    String _date = widget.controller;

    return Row(
      children: <Widget> [
        Container(
          width: widget.width * 0.2,
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: widget.height * 0.018,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(widget.width * 0.04),
        ),
        ElevatedButton(
          onPressed: () async {
            final DateTime selectedDate = await showDatePicker(
                context: context,
                initialDate: widget.start, // 초깃값
                firstDate: widget.start,
                lastDate: DateTime(2022),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: child!,
                  );
                }
            ) as DateTime;
            if (selectedDate != null) {
              widget.date = selectedDate as DateTime;
              _date = formatter.format(widget.date);
              widget.setter(_date); // 상위 위젯으로 날짜 전달
            }
          },
          child: Text(
            _date,
            style: TextStyle(
              color: Colors.black,
              fontSize: widget.height * 0.018,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white.withOpacity(0.9),
              padding: EdgeInsets.fromLTRB(widget.width * 0.15, widget.width * 0.02, widget.width * 0.15, widget.width * 0.02)
          ),
        ),
      ],
    );
  }
}