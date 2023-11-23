import 'package:fitsage_app/custom_widgets/sign_in_widgets/LoginDetails.dart';
import 'package:fitsage_app/custom_widgets/sign_in_widgets/state_less_widgets.dart';
import 'package:fitsage_app/pages/sign%20in%20pages/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 393.0;
    double screenHeight = MediaQuery.of(context).size.height / 852.0;

    return Material(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 70 * screenHeight, 0, 0),
            child: Column(
              children: [
                const Header(),
                SizedBox(
                  height: 60  * screenHeight,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontFamily: "source sans pro",
                    fontSize: 24 * screenHeight ,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 9 * screenHeight),
                Text(
                  "Ready to unlock your best self?",
                  style: TextStyle(
                    fontFamily: "source sans pro",
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 4 * screenHeight,
                ),
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
                SizedBox(height: 73 * screenHeight),
                //TODO: refactor this as a new component when integrating backend
                const LoginDetails(),
                SizedBox(
                  height: screenHeight * 175,
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already Have an Account?",
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
                            text: "Login",
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
                                          const SignInScreen()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight*10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Sign in with other apps",
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
                          iconSize: 35 * screenWidth,
                          onPressed: () {
                            // Perform search action
                          },
                        ),
                        IconButton(
                          iconSize: 35 * screenWidth,
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

