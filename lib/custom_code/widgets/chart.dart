// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key key,
    this.width,
    this.height,
    this.gradientColor1,
    this.gradientColor2,
    this.minX,
    this.minY,
    this.maxX,
    this.maxY,
    this.verticalLineColor,
    this.horizontalLineColor,
    this.backgroundColor,
    this.bottomTitlesColor,
    this.leftTitlesColor,
    this.bottomTitle1,
    this.bottomTitle2,
    this.bottomTitle3,
    this.bottomTitle4,
    this.bottomTitle5,
    this.bottomTitle6,
    this.bottomTitle7,
    this.bottomTitle8,
    this.bottomTitle9,
    this.bottomTitle10,
    this.bottomTitle11,
    this.leftTitle1,
    this.leftTitle2,
    this.leftTitle3,
    this.leftTitle4,
    this.leftTitle5,
    this.leftTitle6,
    this.value0,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
    this.value7,
    this.value8,
    this.value9,
    this.value10,
    this.value11,
  }) : super(key: key);

  final double width;
  final double height;
  final Color gradientColor1;
  final Color gradientColor2;
  final double minX;
  final double minY;
  final double maxX;
  final double maxY;
  final Color verticalLineColor;
  final Color horizontalLineColor;
  final Color backgroundColor;
  final Color bottomTitlesColor;
  final Color leftTitlesColor;
  final String bottomTitle1;
  final String bottomTitle2;
  final String bottomTitle3;
  final String bottomTitle4;
  final String bottomTitle5;
  final String bottomTitle6;
  final String bottomTitle7;
  final String bottomTitle8;
  final String bottomTitle9;
  final String bottomTitle10;
  final String bottomTitle11;
  final String leftTitle1;
  final String leftTitle2;
  final String leftTitle3;
  final String leftTitle4;
  final String leftTitle5;
  final String leftTitle6;
  final double value0;
  final double value1;
  final double value2;
  final double value3;
  final double value4;
  final double value5;
  final double value6;
  final double value7;
  final double value8;
  final double value9;
  final double value10;
  final double value11;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: widget.backgroundColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    List<Color> gradientColors = [
      widget.gradientColor1,
      widget.gradientColor2,
    ];
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: widget.horizontalLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: widget.verticalLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
              color: widget.bottomTitlesColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return widget.bottomTitle1;
              case 2:
                return widget.bottomTitle2;
              case 3:
                return widget.bottomTitle3;
              case 4:
                return widget.bottomTitle4;
              case 5:
                return widget.bottomTitle5;
              case 6:
                return widget.bottomTitle6;
              case 7:
                return widget.bottomTitle7;
              case 8:
                return widget.bottomTitle8;
              case 9:
                return widget.bottomTitle9;
              case 10:
                return widget.bottomTitle10;
              case 11:
                return widget.bottomTitle11;
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
            color: widget.leftTitlesColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return widget.leftTitle1;
              case 2:
                return widget.leftTitle2;
              case 3:
                return widget.leftTitle3;
              case 4:
                return widget.leftTitle4;
              case 5:
                return widget.leftTitle5;
              case 6:
                return widget.leftTitle6;
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: widget.minX,
      maxX: widget.maxX,
      minY: widget.minY,
      maxY: widget.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, widget.value0),
            FlSpot(1, widget.value1),
            FlSpot(2, widget.value2),
            FlSpot(3, widget.value3),
            FlSpot(4, widget.value4),
            FlSpot(5, widget.value5),
            FlSpot(6, widget.value6),
            FlSpot(7, widget.value7),
            FlSpot(8, widget.value8),
            FlSpot(9, widget.value9),
            FlSpot(10, widget.value10),
            FlSpot(11, widget.value11),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
