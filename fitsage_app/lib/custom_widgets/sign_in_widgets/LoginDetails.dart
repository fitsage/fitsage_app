import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitsage_app/pages/sign%20in%20pages/Personaldata.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);


  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 393.0;
    double screenHeight = MediaQuery.of(context).size.height / 852.0;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 30 * screenWidth),
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
              SizedBox(height: 25 * screenHeight),
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
          height: screenHeight * 50 ,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding:
            EdgeInsets.fromLTRB(0, 0, screenWidth * 30 , 0),
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
                width: 60 * screenWidth,
                height: 35 * screenHeight,
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
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


