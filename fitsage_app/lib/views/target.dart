import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/views/Activitylevel.dart';
import 'package:fitsage_app/views/Home.dart';
import 'package:fitsage_app/views/minutes.dart';
import 'package:flutter/material.dart';
import 'am_pm.dart';
import 'hours.dart';

class Target extends StatefulWidget {
  const Target({Key? key}) : super(key: key);

  @override
  _TargetState createState() => _TargetState();
}

class _TargetState extends State<Target> {
  int selectedHourIndex = 0;
  int selectedMinuteIndex = 0;
  int selectedAmPmIndex = 0;
  String selectedGender = '';
  late FixedExtentScrollController _controller;
  Color skipTextColor = Colors.black.withOpacity(0.4);

  void changeTextColor() {
    setState(() {
      skipTextColor = Colors.black
          .withOpacity(0.8); // Change this color to your desired color
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: 0);

    _startInitialScrolling();
  }

  void _startInitialScrolling() async {
    for (int i = 0; i <= 60; i++) {
      await Future.delayed(const Duration(milliseconds: 1));
      _controller.jumpToItem(i);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                          (30 / 393) * screenWidth, 0, 0, 0),
                      child: Headerarrow(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
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
                SizedBox(
                  height: (60 / 852) * screenHeight,
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Target Weight",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 24 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * (40 / 852),
                    ),
                    Image.asset(
                      "assets/images/target.png",
                      width: screenWidth * (132.02 / 393),
                      height: screenHeight * (130 / 852),
                    ),
                    SizedBox(
                      height: screenHeight * (36 / 852),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Your ideal range is ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "52",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF008000).withOpacity(1),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " - ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "72",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF008000).withOpacity(1),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF008000).withOpacity(1),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "kgs",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * (16 / 852),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Weight loss of",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "8",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF008000).withOpacity(1),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "kgs",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16 * (screenHeight / 852),
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * (15 / 852),
                    ),
                    SizedBox(
                      width: 330,
                      height: 270,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top:
                                110, // Adjust this value to center the grey container vertically
                            child: Container(
                              width: 210,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF514644).withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Hours wheel
                              SizedBox(
                                width: 60,
                                child: ListWheelScrollView.useDelegate(
                                  controller: _controller,
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedHourIndex = index;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 272,
                                    builder: (context, index) {
                                      final isSelected =
                                          index == selectedHourIndex;
                                      return MyHours(
                                        hours: index,
                                        fontSize: 35,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedMinuteIndex = index;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 10,
                                    builder: (context, index) {
                                      final isSelected =
                                          index == selectedMinuteIndex;
                                      return MyMinutes(
                                        mins: index,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // AM or PM
                              SizedBox(
                                width: 60,
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedAmPmIndex = index;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 2,
                                    builder: (context, index) {
                                      final isSelected =
                                          index == selectedAmPmIndex;
                                      if (index == 0) {
                                        return AmPm(
                                          isItAm: true,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        );
                                      } else {
                                        return AmPm(
                                          isItAm: false,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * (15 / 852),
                    ),
                    Align(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Activitylevel()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF514644),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: (60 / 393) * screenWidth,
                          height: (40 / 852) * screenHeight,
                          child: const Align(
                            alignment: Alignment
                                .center, // Horizontally centering only the text
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
