import 'package:fitsage_app/pages/Main_page.dart';
import 'package:fitsage_app/pages/Tracking.dart';
import 'package:fitsage_app/pages/planner.dart';
import 'package:fitsage_app/pages/shopping.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> pages = const [
    MainPage(),
    Planner(),
    Tracking(),
    Shopping(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: 62 * (screenHeight / 852),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              unselectedFontSize: 12,
              selectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFFF4F3F2),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black.withOpacity(0.6),
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: "Fitsage",
                  icon: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Adjust the bottom padding here
                    child: SizedBox(
                        width: 17,
                        height: 19,
                        child: Opacity(
                          opacity: _currentIndex == 0 ? 1.0 : 0.6,
                          child: Image.asset('assets/images/Home.png',
                              width: 16, height: 18),
                        )),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Planner",
                  icon: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Adjust the bottom padding here
                    child: SizedBox(
                        width: 17,
                        height: 19,
                        child: Opacity(
                          opacity: _currentIndex == 1 ? 1.0 : 0.6,
                          child: Image.asset('assets/images/planner.png',
                              width: 16.97, height: 18),
                        )),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Trackers",
                  icon: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Adjust the bottom padding here
                    child: SizedBox(
                        width: 17,
                        height: 19,
                        child: Opacity(
                          opacity: _currentIndex == 2 ? 1.0 : 0.6,
                          child: Image.asset('assets/images/tracking.png',
                              width: 18, height: 18),
                        )),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Glossary List",
                  icon: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Adjust the bottom padding here
                    child: SizedBox(
                        width: 17,
                        height: 19,
                        child: Opacity(
                          opacity: _currentIndex == 3 ? 1.0 : 0.6,
                          child: Image.asset('assets/images/list.png',
                              width: 16, height: 18),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}