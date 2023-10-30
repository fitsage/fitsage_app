import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  Color lineColor = const Color(0xFFEFC8B1);
  Color gradientStartColor = const Color(0xFFEFC8B1).withOpacity(0.4);
  Color gradientEndColor = const Color(0xFFF4F3F2).withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        mainData(),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      fontFamily: "source sans pro",
    );

    String text;
    if (value.toInt() >= 1 && value.toInt() <= 5) {
      text = 'Week-${value.toInt()}';
    } else {
      text = '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      fontFamily: "source sans pro",
    );
    String text;
    if (value.toInt() == 200 || value.toInt() == 100) {
      text = '${value.toInt()}';
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 20,
          ),
        ),
      ),
      gridData: FlGridData(show: false), // Hide grid lines
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color(0xFFFFFFFF)),
      ),
      minX: 0,
      maxX: 5, // Adjust the x-axis maximum to 5 weeks
      minY: 0,
      maxY: 200,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 200),
            FlSpot(1, 170),
            FlSpot(2, 150),
            FlSpot(3, 130),
            FlSpot(4, 110),
            FlSpot(5, 90),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [lineColor, gradientStartColor],
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
            ),
          ),
        ),
      ],
    );
  }
}
