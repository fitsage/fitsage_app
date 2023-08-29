import 'package:flutter/material.dart';

class MyHours extends StatelessWidget {
  final int hours;
  final double fontSize; // New parameter for font size customization
  final Color color; // New parameter for text color

  MyHours({required this.hours, this.fontSize = 35.0, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          hours.toString(),
          style: TextStyle(
            fontFamily: "source sans pro",
            fontWeight: FontWeight.normal,
            fontSize: fontSize, // Use the custom font size parameter
            color: color, // Use the custom color parameter
          ),
        ),
      ),
    );
  }
}
