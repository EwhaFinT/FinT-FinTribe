import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedHorizontalBarChart extends StatefulWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate = false});
  _StackedHorizontalBarChart createState() => _StackedHorizontalBarChart();
}

class _StackedHorizontalBarChart extends State<StackedHorizontalBarChart> {

  Widget build(BuildContext context) {
    return new charts.BarChart(
      widget.seriesList,
      animate: widget.animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }
}