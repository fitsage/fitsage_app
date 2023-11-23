import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width/393;

    return Padding(
      padding: EdgeInsets.fromLTRB(30  * screenWidth, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoPic(width: 34  * screenWidth),
          SizedBox(width: screenWidth * 20),
          const HeaderText(),
        ],
      ),
    );
  }
}

class Headerarrow extends StatelessWidget {
  final VoidCallback onPressed;

  const Headerarrow({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArrowPic(
          width: (23.73 / 393) * screenWidth,
          onPressed: onPressed,
        ),
        SizedBox(width: screenWidth * (20 / 393)),
        const HeaderText(),
      ],
    );
  }
}

class ArrowPic extends StatelessWidget {
  const ArrowPic({Key? key, this.width = 50, required this.onPressed})
      : super(key: key);

  final double width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        "assets/images/back.png",
        width: width,
        height: width * (20 / 23.73),
      ),
    );
  }
}

class LogoPic extends StatelessWidget {
  const LogoPic({Key? key, this.width = 50}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      width: width,
      height: width * (25 / 34),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return const Text(
      "FitSage",
      style: TextStyle(
        color: Colors.black,
        fontFamily: "source sans pro",
        fontSize: 27,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
    );
  }
}
