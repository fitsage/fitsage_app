import 'package:flutter/material.dart';

class CustomMealList extends StatelessWidget {
  final String mealName;
  final calIntake;
  final calTarget;
  final VoidCallback onNext;

  const CustomMealList({
    Key? key,
    required this.mealName,
    required this.calIntake,
    required this.calTarget,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: (283 / 393) * screenWidth,
      child: Column(
        children: [
          GestureDetector(
            onTap: onNext,
            child: Container(
              width: (253 / 393) * screenWidth,
              height: (25 / 393) * screenHeight,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F3F2).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: (10 / 393) * screenWidth),
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
                  const Spacer(),
                  Text(
                    "${calIntake.toStringAsFixed(0)} out of ${calTarget.toStringAsFixed(0)} Cal",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 10,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(width: (5 / 393) * screenWidth),
                  const Icon(
                    Icons.add,
                    size: 20,
                  ),
                  SizedBox(width: (10 / 393) * screenWidth),
                ],
              ),
            ),
          ),
          SizedBox(height: (5 / 393) * screenHeight),
        ],
      ),
    );
  }
}
