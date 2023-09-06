import 'package:fitsage_app/custom_widgets/utility_widgets.dart';
import 'package:fitsage_app/views/Personaldata.dart';
import 'package:fitsage_app/views/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

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
                  child: const Header(),
                ),
                SizedBox(
                  height: (60 / 852) * screenHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 24 * (screenHeight / 852),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: (9 / 852) * screenHeight),
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
                      height: (4 / 852) * screenHeight,
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
                  ],
                ),
                SizedBox(height: (73 / 852) * screenHeight),
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
                          labelText: 'Enter your username',
                          labelStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.all(0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      SizedBox(height: (25 / 852) * screenHeight),
                      TextFormField(
                        cursorColor: const Color(0xFF514644),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF514644),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFEFC8B1),
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(fontSize: 18),
                          contentPadding: const EdgeInsets.all(0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        obscureText: _obscureText,
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
                          MaterialPageRoute(
                              builder: (context) => const PersonalData()),
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
                SizedBox(
                  height: screenHeight * (175 / 852),
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
                      height: screenHeight * (10 / 852),
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
                      height: screenHeight * (5 / 852),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.facebook),
                          iconSize: (35 / 393) * screenWidth,
                          onPressed: () {
                            // Perform search action
                          },
                        ),
                        IconButton(
                          iconSize: (35 / 393) * screenWidth,
                          icon: const Icon(Icons.facebook),
                          onPressed: () {
                            // Show more options
                          },
                        ),
                        IconButton(
                          iconSize: (35 / 393) * screenWidth,
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
      ),
    );
  }
}
