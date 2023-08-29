// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyMinutes extends StatelessWidget {
  int mins;
  final Color color;

  MyMinutes({required this.mins, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          mins < 10 ? '. ' + mins.toString() : mins.toString(),
          style: TextStyle(
            fontFamily: "source sans pro",
            fontWeight: FontWeight.normal,
            fontSize: 25,
            color: color,
          ),
        ),
      ),
    );
  }
}
