import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/utility_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      home: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, (70 / 852) * screenHeight, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB((30 / 393) * screenWidth, 0, 0, 0),
                child: const Header(),
              ),
              SizedBox(height: (107 / 852) * screenHeight),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: (12 / 393) * screenWidth),
                child: Image.asset("assets/images/welcome.png"),
              ),
              SizedBox(height: (80 / 852) * screenHeight),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: (71 / 393) * screenWidth),
                child: SizedBox(
                  width: screenWidth * (253 / 393),
                  child: const Text(
                    "Welcome to the Ultimate You!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "source sans pro",
                      fontSize: 19.5,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: (85 / 393) * screenWidth),
                child: SizedBox(
                  width: screenWidth * (225 / 393),
                  child: const Text(
                    "Ready to unlock your best self?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "source sans pro",
                      fontSize: 15.5,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (77 / 852) * screenHeight,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * (118 / 393)),
                child: SizedBox(
                  height: screenHeight * (35 / 852),
                  width: screenWidth * (159 / 393),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * (16 / 852),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * (83 / 393)),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already Have an Account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "source sans pro",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                          text: "Login",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "source sans pro",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Double tapped.
                            }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
