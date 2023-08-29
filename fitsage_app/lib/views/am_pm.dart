// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isItAm;
  final Color color;

  AmPm({required this.isItAm, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          isItAm == true ? 'Kg' : 'Lb',
          style: TextStyle(
            fontFamily: "source sans pro",
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}
