import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 62, // Set the desired height
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            unselectedFontSize: 12,
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFFFFFFFF).withOpacity(1.0),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(0.5),
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(
                    "assets/icons/Home.svg",
                    height: 18,
                    color: currentIndex == 0
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                  // Container(
                  //     height: (18 / 852) * screenHeight,
                  //     child: Opacity(
                  //       opacity: currentIndex == 0 ? 1.0 : 1.0,
                  //       child: Image.asset(
                  //         'assets/images/Home.png',
                  //         // width: (16 / 393) * screenWidth,
                  //         // height: (18 / 852) * screenHeight,
                  //       ),
                  //     )),
                ),
              ),
              BottomNavigationBarItem(
                label: "FitMeal",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(
                    "assets/icons/Fitmeal.svg",
                    height: 18,
                    color: currentIndex == 1
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                  // Container(
                  //     height: (18 / 852) * screenHeight,
                  //     child: Opacity(
                  //       opacity: currentIndex == 1 ? 1.0 : 1,
                  //       child: Image.asset(
                  //         'assets/images/planner.png',
                  //         // width: (16.97 / 393) * screenWidth,
                  //         // height: (18 / 852) * screenHeight,
                  //       ),
                  //     )),
                ),
              ),
              BottomNavigationBarItem(
                label: "Trackers",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(
                    "assets/icons/Tracker.svg",
                    height: 18,
                    color: currentIndex == 2
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                  // Container(
                  //     height: (18 / 852) * screenHeight,
                  //     child: Opacity(
                  //       opacity: currentIndex == 2 ? 1.0 : 1,
                  //       child: Image.asset(
                  //         'assets/images/tracking.png',
                  //         // width: (18 / 393) * screenWidth,
                  //         // height: (18 / 852) * screenHeight,
                  //       ),
                  //     )),
                ),
              ),
              BottomNavigationBarItem(
                label: "Glossary",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(
                    "assets/icons/list.svg",
                    height: 18,
                    color: currentIndex == 3
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                  // Container(
                  //   height: (18 / 852) * screenHeight,
                  //   width: (18 / 393) * screenWidth,
                  //   child: Opacity(
                  //     opacity: currentIndex == 3 ? 1.0 : 1,
                  //     child: Image.asset(
                  //       'assets/images/list.png',
                  //       width: (18 / 393) * screenWidth,
                  //       height: (18 / 852) * screenHeight,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
