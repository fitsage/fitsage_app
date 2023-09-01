import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/views/Home.dart';
import 'package:flutter/material.dart';

class Weekly extends StatefulWidget {
  const Weekly({Key? key}) : super(key: key);

  @override
  _WeeklyState createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  String selectedGender = '';
  Color skipTextColor = Colors.black.withOpacity(0.4);

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
                            text: "Weekly Goal",
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
                      height: screenHeight * (60 / 852),
                    ),
                    Image.asset(
                      "assets/images/weekly.png",
                      width: screenWidth * (197.09 / 393),
                      height: screenHeight * (138.21 / 852),
                    ),
                    SizedBox(
                      height: screenHeight * (50 / 852),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "your calories intake",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 20 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 20 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "1429",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 20 * (screenHeight / 852),
                              color: const Color(0xFFEFC8B1),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * (9 / 852),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Fit in",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 18 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 18 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "10 Weeks",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 18 * (screenHeight / 852),
                              color: const Color(0xFFEFC8B1),
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
                                builder: (context) => const Home()),
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
