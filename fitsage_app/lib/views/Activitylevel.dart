import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/views/Weekly.dart';
import 'package:flutter/material.dart';

class Activitylevel extends StatefulWidget {
  const Activitylevel({Key? key}) : super(key: key);

  @override
  _ActivitylevelState createState() => _ActivitylevelState();
}

class _ActivitylevelState extends State<Activitylevel> {
  String selectedLevel = '';

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
                            text: "Activity Level",
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
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: (49 / 852) * screenHeight),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = 'No Active';
                        });
                      },
                      child: Container(
                        width: (333 / 393) * screenWidth,
                        height: (58 / 852) * screenHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFC8B1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: selectedLevel == 'No Active'
                                ? Colors.black.withOpacity(0.5)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  (17 / 393) * screenWidth, 0, 0, 0),
                            ),
                            Image.asset(
                              "assets/images/noactivity.png",
                              width: screenWidth * (60.47 / 393),
                              height: screenHeight * (40 / 852),
                            ),
                            SizedBox(width: (11.53 / 393) * screenWidth),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No Active',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    color:
                                        const Color(0xFF000000).withOpacity(1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(height: (7 / 852) * screenHeight),
                                Text(
                                  'Desk job, little exercise, Sedentary lifestyle.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: (30 / 852) * screenHeight),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = 'Lightly Active';
                        });
                      },
                      child: Container(
                        width: (333 / 393) * screenWidth,
                        height: (58 / 852) * screenHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFC8B1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: selectedLevel == 'Lightly Active'
                                ? Colors.black.withOpacity(0.5)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (31 / 393) * screenWidth, 0, 0, 0),
                              ),
                              Image.asset(
                                "assets/images/lightlyactive.png",
                                width: screenWidth * (32.83 / 393),
                                height: screenHeight * (40 / 852),
                              ),
                              SizedBox(width: (25.17 / 393) * screenWidth),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lightly Active',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(height: (7 / 852) * screenHeight),
                                  Text(
                                    'Regular walks, light exercises.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: (30 / 852) * screenHeight),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = 'Moderately Active';
                        });
                      },
                      child: Container(
                        width: (333 / 393) * screenWidth,
                        height: (58 / 852) * screenHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFC8B1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: selectedLevel == 'Moderately Active'
                                ? Colors.black.withOpacity(0.5)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (26 / 393) * screenWidth, 0, 0, 0),
                              ),
                              Image.asset(
                                "assets/images/noactivity.png",
                                width: screenWidth * (36.54 / 393),
                                height: screenHeight * (40 / 852),
                              ),
                              SizedBox(width: (26.46 / 393) * screenWidth),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Moderately Active',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(height: (7 / 852) * screenHeight),
                                  Text(
                                    'Regular workouts 3-4 times a week.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: (30 / 852) * screenHeight),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = 'Very Active';
                        });
                      },
                      child: Container(
                        width: (333 / 393) * screenWidth,
                        height: (58 / 852) * screenHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFC8B1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: selectedLevel == 'Very Active'
                                ? Colors.black.withOpacity(0.5)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (26 / 393) * screenWidth, 0, 0, 0),
                              ),
                              Image.asset(
                                "assets/images/veryactive.png",
                                width: screenWidth * (21.89 / 393),
                                height: screenHeight * (40 / 852),
                              ),
                              SizedBox(width: (39.87 / 393) * screenWidth),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Very Active',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(height: (7 / 852) * screenHeight),
                                  Text(
                                    'Intense workouts, High activity levels daily.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: (30 / 852) * screenHeight),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = 'Intensely Active';
                        });
                      },
                      child: Container(
                        width: (333 / 393) * screenWidth,
                        height: (58 / 852) * screenHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFC8B1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: selectedLevel == 'Intensely Active'
                                ? Colors.black.withOpacity(0.5)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    (27 / 393) * screenWidth, 0, 0, 0),
                              ),
                              Image.asset(
                                "assets/images/intenseactive.png",
                                width: screenWidth * (21.89 / 393),
                                height: screenHeight * (40 / 852),
                              ),
                              SizedBox(width: (40.11 / 393) * screenWidth),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Intensely Active',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(height: (7 / 852) * screenHeight),
                                  Text(
                                    'Professional athletes  training.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * (57 / 852),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 0, screenWidth * (30 / 393), 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Weekly()),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
