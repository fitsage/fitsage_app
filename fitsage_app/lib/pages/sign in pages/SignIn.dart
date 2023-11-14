import 'package:fitsage_app/custom_widgets/sign_in_widgets/LoginDetails.dart';
import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/pages/sign%20in%20pages/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitsage_app/pages/sign%20in%20pages/Personaldata.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width/393;
    double screenHeight = MediaQuery.of(context).size.height/852;

    return Material(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 70  * screenHeight, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(30  * screenWidth, 0, 0, 0),
                  child: const Header(),
                ),
                SizedBox(
                  height: 60 * screenHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 24 * screenHeight ,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 9  * screenHeight),
                    Text(
                      "#SagePathToFIt",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 73  * screenHeight),
                LoginDetails(),
                SizedBox(
                  height: screenHeight * 200 ,
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "New here ?",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "source sans pro",
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "  ",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "source sans pro",
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "Create New",
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "source sans pro",
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Login with other apps",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "source sans pro",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 5 ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.facebook),
                          iconSize: 35  * screenWidth,
                          onPressed: () {
                            // Perform search action
                          },
                        ),
                        IconButton(
                          iconSize: 35  * screenWidth,
                          icon: const Icon(Icons.facebook),
                          onPressed: () {
                            // Show more options
                          },
                        ),
                        IconButton(
                          iconSize: 35  * screenWidth,
                          icon: const Icon(Icons.facebook),
                          onPressed: () {
                            // Show more options
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
