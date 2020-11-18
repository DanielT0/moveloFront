import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:movelo/ui/constantes.dart';

class LineReportChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show:false),
          
          lineBarsData: [
            LineChartBarData(
              spots: getSpots(),
              isCurved: true,
              colors: [kPrimaryColor],
              barWidth: 4,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

List<FlSpot> getSpots() {
  return [
    FlSpot(0, 4),
    FlSpot(1, 6),
    FlSpot(2, 4),
    FlSpot(3, 1.5),
    FlSpot(4, 4),
    FlSpot(5, 9),
    FlSpot(6, 5),
    FlSpot(7, 13),
    FlSpot(8, 14),
  ];
}
