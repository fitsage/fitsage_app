import 'package:fitsage_app/pages/Home.dart';
// import 'package:fitsage_app/pages/confetti.dart';
// import 'package:fitsage_app/views/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Color primaryColor = const Color(0xFFEFC8B1);

  @override
  Widget build(BuildContext context) {
    MaterialColor primarySwatch = MaterialColor(
      primaryColor.value,
      <int, Color>{
        50: primaryColor,
        100: primaryColor,
        200: primaryColor,
        300: primaryColor,
        400: primaryColor,
        500: primaryColor,
        600: primaryColor,
        700: primaryColor,
        800: primaryColor,
        900: primaryColor,
      },
    );

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: const Home(),
    );
  }
}
