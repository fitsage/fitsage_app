import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/pages/Home.dart';
import 'package:fitsage_app/views/bmicalculation.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
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
                            text: "Hey",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 24 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 24 * (screenHeight / 852),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "Name",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 24 * (screenHeight / 852),
                              color: const Color(0xFFEFC8B1),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: " !",
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
                    SizedBox(height: (9 / 852) * screenHeight),
                    Text(
                      "Tell us more about you!",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: (79 / 852) * screenHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = 'male';
                            });
                          },
                          child: Container(
                            width: (100 / 393) * screenWidth,
                            height: (58 / 852) * screenHeight,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFC8B1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: selectedGender == 'male'
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/male.png",
                                    width: screenWidth * (30 / 393),
                                    height: screenHeight * (25.36 / 852),
                                  ),
                                  SizedBox(width: (4 / 393) * screenWidth),
                                  Text(
                                    'Male',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF514644)
                                          .withOpacity(1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (16.5 / 393) * screenWidth),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = 'female';
                            });
                          },
                          child: Container(
                            width: (100 / 393) * screenWidth,
                            height: (58 / 852) * screenHeight,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFC8B1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: selectedGender == 'female'
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/female.png",
                                    width: screenWidth * (30 / 393),
                                    height: screenHeight * (25.36 / 852),
                                  ),
                                  SizedBox(width: (4 / 393) * screenWidth),
                                  Text(
                                    'Female',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF514644)
                                          .withOpacity(1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (16.5 / 393) * screenWidth),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = 'other';
                            });
                          },
                          child: Container(
                            width: (100 / 393) * screenWidth,
                            height: (58 / 852) * screenHeight,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFC8B1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: selectedGender == 'other'
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Others',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  color: const Color(0xFF514644).withOpacity(1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: (18 / 852) * screenHeight),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (30 / 393) * screenWidth),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: const Color(0xFF514644),
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF514644),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFEFC8B1),
                            ),
                          ),
                          labelText: 'Age',
                          labelStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.all(0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      SizedBox(height: (18 / 852) * screenHeight),
                      TextFormField(
                        cursorColor: const Color(0xFF514644),
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF514644),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFEFC8B1),
                            ),
                          ),
                          labelText: 'Location',
                          labelStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.all(0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * (50 / 852),
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
                          MaterialPageRoute(builder: (context) => const Bmi()),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
