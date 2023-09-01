import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/views/bmicalculation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color skipTextColor = Colors.black.withOpacity(0.4);
  String selectedGender = '';

  void changeTextColor() {
    setState(() {
      skipTextColor = Colors.black
          .withOpacity(0.8); // Change this color to your desired color
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, (70 / 852) * screenHeight, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        (30 / 393) * screenWidth,
                        0,
                        0,
                        0,
                      ),
                      child: const Header(),
                    ),
                    const Spacer(), // Add a spacer to push the next widget to the right edge
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        screenWidth * (30 / 393),
                        0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          changeTextColor();
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color:
                                skipTextColor, // Use the skipTextColor variable here
                            fontFamily: "source sans pro",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
