import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealplanList extends StatelessWidget {
  final String mealName;
  final String calIntake;
  final String calTarget;
  final String type;
  final VoidCallback onNext;
  final bool selected;

  MealplanList({
    Key? key,
    required this.mealName,
    required this.calIntake,
    required this.calTarget,
    required this.type,
    required this.onNext,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onNext,
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: (32 / 852) * screenHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mealName,
                        style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 14,
                          color: Colors.black.withOpacity(1.0),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        height: (3 / 852) * screenHeight,
                      ),
                      Text(
                        "$calIntake $type",
                        style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 10,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "$calTarget cal",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 10,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(width: (5 / 393) * screenWidth),
                  selected
                      ? SvgPicture.asset(
                          "assets/icons/Right.svg",
                          height: 11,
                        )
                      : SvgPicture.asset(
                          "assets/icons/add.svg",
                          height: 16.5,
                        )
                ],
              ),
            ),
            SizedBox(height: (10 / 852) * screenHeight),
          ],
        ),
      ),
    );
  }
}
