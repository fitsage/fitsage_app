import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/views/Activitylevel.dart';
import 'package:flutter/material.dart';

class Target extends StatefulWidget {
  const Target({Key? key}) : super(key: key);

  @override
  _TargetState createState() => _TargetState();
}

class _TargetState extends State<Target> {
  String selectedGender = '';

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
                Padding(
                  padding:
                      EdgeInsets.fromLTRB((30 / 393) * screenWidth, 0, 0, 0),
                  child: Headerarrow(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
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
                      height: screenHeight * (50 / 852),
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
                          height: (35 / 852) * screenHeight,
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
