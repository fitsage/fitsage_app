import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.amber,
      height: screenHeight*0.0399,
      width: screenWidth*0.343,
      child: Row(
        children: [
          const LogoPic(),
          SizedBox(width: screenWidth*0.073),
          const HeaderText(),
        ],
      ),
    );
  }
}

class LogoPic extends StatelessWidget {
  const LogoPic({Key? key, this.width = 50}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {

    return Image.asset("assets/images/logo.png");
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "FitSage",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "source sans pro",
          fontSize: 27,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none),
    );
  }
}
