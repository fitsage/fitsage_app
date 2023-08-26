import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.04,
      width: screenWidth * (135 / 393),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LogoPic(width: 25),
          SizedBox(width: screenWidth * (20 / 393)),
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
    return Image.asset("assets/images/logo.png",width: width);
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width:(81/393)* screenWidth,
      child: const Text(
        "FitSage",
        style: TextStyle(
            color: Colors.black,
            fontFamily: "source sans pro",
            fontSize: 20,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none),
      ),
    );
  }
}
