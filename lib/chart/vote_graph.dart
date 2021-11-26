import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/vote_rate.dart';

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series<VoteRate, String>> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }
}

class ReceiveFromServer {
  Future<VoteRate> receiveFromServer(int voteId) async {
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'voteId': voteId,
          }
      ),
    );

    if(response.statusCode == 200) return json.decode(response.body);
    throw Exception();
  }
}