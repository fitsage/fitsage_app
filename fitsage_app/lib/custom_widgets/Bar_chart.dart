import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _BarChart extends StatelessWidget {
  final List<double> toyValues;
  final double horizontalLineY;

  _BarChart({
    required this.toyValues,
    required this.horizontalLineY,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: horizontalLineY,
              color: Colors.grey.withOpacity(0.4),
              strokeWidth: 1.4,
              dashArray: [10, 10],
            ),
          ],
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 3,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.normal,
                fontFamily: "source sans pro",
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black.withOpacity(1.0),
      fontWeight: FontWeight.normal,
      fontSize: 10,
      fontFamily: "source sans pro",
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  Color getBarsColor(int index) {
    // Alternate between two colors based on the index
    final List<Color> colors = [
      const Color(0xFFEFC8B1),
      const Color(0xFF958482),
    ];
    final int colorIndex = index % colors.length;
    return colors[colorIndex];
  }

  List<BarChartGroupData> get barGroups {
    return toyValues.asMap().entries.map((entry) {
      final int index = entry.key;
      final double value = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            color: getBarsColor(index), // Use the custom color function
          )
        ],
        showingTooltipIndicators: [0],
      );
    }).toList();
  }
}

class BarChartSample3 extends StatefulWidget {
  final List<double> toyValues;
  final double horizontalLineY; // Add this parameter

  const BarChartSample3({
    Key? key,
    required this.toyValues,
    required this.horizontalLineY, // Initialize the parameter
  }) : super(key: key);

  @override
  State<BarChartSample3> createState() => _BarChartSample3State();
}

class _BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(
        toyValues: widget.toyValues,
        horizontalLineY: widget.horizontalLineY, // Pass the parameter value
      ),
    );
  }
}
