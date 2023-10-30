import 'package:fitsage_app/custom_widgets/Custom_Navbar.dart';
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

  List<Widget> pages = [
    MainPage(),
    Planner(),
    Tracking(selectedOption: 'Calories'),
    Shopping(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
