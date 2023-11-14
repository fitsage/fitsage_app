import 'package:fitsage_app/custom_widgets/sign_in_widgets/state_less_widgets.dart';
import 'package:fitsage_app/pages/sign%20in%20pages/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitsage_app/pages/sign%20in%20pages/SignIn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width/393;
    double screenHeight = MediaQuery.of(context).size.height/852;
    return  Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 70 * screenHeight, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(),
              SizedBox(height: 107 * screenHeight),
              Image.asset(
                "assets/images/welcome.png",
                width: screenWidth * 370,
                height: screenHeight * 280,
              ),
              SizedBox(height: 80  * screenHeight),
              const Text(
                "Welcome to the Ultimate You!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "source sans pro",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                width: screenWidth * 225 ,
                child: Text(
                  "Ready to unlock your best self?",
                  textAlign: TextAlign.center,
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
                height: 77  * screenHeight,
              ),
              SizedBox(
                height: screenHeight * 35 ,
                width: screenWidth * 159,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the second page when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color(0xFF514644),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 20 ,
              ),
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
                      text: " ",
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            );
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
