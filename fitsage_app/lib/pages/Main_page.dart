import 'package:fitsage_app/pages/Breakdown.dart';
import 'package:fitsage_app/pages/MealList.dart';
import 'package:fitsage_app/pages/Personal_details.dart';
import 'package:fitsage_app/pages/Remainder.dart';
import 'package:fitsage_app/pages/Tracking_Alert.dart';
import 'package:fitsage_app/pages/goals.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void openAlertFullScreenDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertFullScreenDialog(onDialogDismissed: toggleExpand);
        },
      );
      toggleExpand();
    }
  }

  void TrackingDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return TrackingAddDialog(
            onDialogDismissed: toggleExpand,
            // currentIndex: _currentIndex,
          );
        },
      );
      toggleExpand();
    }
  }

  PageController pageController = PageController(viewportFraction: 1);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: (35 / 852) * screenHeight),
            sliver: SliverAppBar(
              backgroundColor: Color(0xFFFFFFFF),
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: SizedBox(
                  height: (31.21 / 852) * screenHeight,
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16.71,
                        height: 17.66,
                        child: Image.asset(
                          'assets/images/planner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: (6 / 393) * screenWidth),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 12,
                          color: Colors.black.withOpacity(1.0),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(width: (15 / 393) * screenWidth),
                      SizedBox(
                        width: 12.72,
                        height: 17.66,
                        child: Image.asset(
                          'assets/images/streak.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: (6 / 393) * screenWidth),
                      Text(
                        "2days",
                        style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 12,
                          color: Colors.black.withOpacity(1.0),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(width: (15 / 393) * screenWidth),
                      SizedBox(
                        width: 14,
                        height: 17.66,
                        child: Image.asset(
                          'assets/images/notification.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: (15 / 393) * screenWidth),
                      GestureDetector(
                        onTap: openAlertFullScreenDialog,
                        child: Container(
                          height: (31.21 / 852) * screenHeight,
                          width: (31.21 / 393) * screenWidth,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/profile.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: (20 / 393) * screenWidth),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    SizedBox(
                      height: (10 / 852) * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: (20 / 393) * screenWidth),
                        Text(
                          "Hi",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "Madhu",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          ",",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (2 / 852) * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: (20 / 393) * screenWidth),
                        Text(
                          "You've",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "loss",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "2 kg",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: const Color(0xFF177D15).withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          ",",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "let's go!",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          width: 13,
                          height: 13,
                          child: Image.asset(
                            'assets/images/hand.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (20 / 852) * screenHeight,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 55,
                          width: 363,
                          child: PageView(
                            controller: pageController,
                            children: List.generate(5, (index) {
                              return Container(
                                height: 55,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 55,
                                      width: 363,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEFC8B1)
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: (11 / 852) * screenHeight,
                                    // ),
                                    // Align(
                                    //   alignment: Alignment.bottomCenter,
                                    //   child: Container(
                                    //     height: 76,
                                    //     width: 293,
                                    //     margin:
                                    //         const EdgeInsets.only(bottom: 5),
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.white,
                                    //       border: Border.all(
                                    //         color: const Color(0xFFe8e8e8)
                                    //             .withOpacity(0.6),
                                    //         width: 1.0,
                                    //       ),
                                    //       borderRadius:
                                    //           BorderRadius.circular(15),
                                    //     ),
                                    //     child: Row(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.center,
                                    //       children: [
                                    //         const Spacer(),
                                    //         Column(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.start,
                                    //           children: [
                                    //             Row(
                                    //               children: [
                                    //                 const Text(
                                    //                   "Protein",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   ":",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   " ",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   "10%",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 8,
                                    //                     color: Colors.black
                                    //                         .withOpacity(0.6),
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             const SizedBox(height: 5),
                                    //             const SizedBox(
                                    //               width: 55,
                                    //               height: 4,
                                    //               child:
                                    //                   LinearProgressIndicator(
                                    //                 value: 0.4,
                                    //                 valueColor:
                                    //                     AlwaysStoppedAnimation<
                                    //                             Color>(
                                    //                         Color(0xFFEFC8B1)),
                                    //                 backgroundColor:
                                    //                     Color(0xFFD9D9D9),
                                    //                 semanticsValue: '40%',
                                    //               ),
                                    //             ),
                                    //             const SizedBox(
                                    //               height: 11,
                                    //             ),
                                    //             Row(
                                    //               children: [
                                    //                 const Text(
                                    //                   "Fats",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   ":",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   " ",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   "10%",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 8,
                                    //                     color: Colors.black
                                    //                         .withOpacity(0.6),
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             const SizedBox(height: 5),
                                    //             const SizedBox(
                                    //               width: 55,
                                    //               height: 4,
                                    //               child:
                                    //                   LinearProgressIndicator(
                                    //                 value: 1,
                                    //                 valueColor:
                                    //                     AlwaysStoppedAnimation<
                                    //                             Color>(
                                    //                         Color(0xFFEFC8B1)),
                                    //                 backgroundColor:
                                    //                     Color(0xFFD9D9D9),
                                    //                 semanticsValue: '40%',
                                    //               ),
                                    //             )
                                    //           ],
                                    //         ),
                                    //         const Spacer(),
                                    //         Column(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.start,
                                    //           children: [
                                    //             Row(
                                    //               children: [
                                    //                 const Text(
                                    //                   "Carbs",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   ":",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   " ",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   "10%",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 8,
                                    //                     color: Colors.black
                                    //                         .withOpacity(0.6),
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             const SizedBox(height: 5),
                                    //             const SizedBox(
                                    //               width: 55,
                                    //               height: 4,
                                    //               child:
                                    //                   LinearProgressIndicator(
                                    //                 value: 0.4,
                                    //                 valueColor:
                                    //                     AlwaysStoppedAnimation<
                                    //                             Color>(
                                    //                         Color(0xFFEFC8B1)),
                                    //                 backgroundColor:
                                    //                     Color(0xFFD9D9D9),
                                    //                 semanticsValue: '40%',
                                    //               ),
                                    //             ),
                                    //             const SizedBox(
                                    //               height: 11,
                                    //             ),
                                    //             Row(
                                    //               children: [
                                    //                 const Text(
                                    //                   "Fiber",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   ":",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 const Text(
                                    //                   " ",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 10,
                                    //                     color: Colors.black,
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   "10%",
                                    //                   style: TextStyle(
                                    //                     fontFamily:
                                    //                         "source sans pro",
                                    //                     fontSize: 8,
                                    //                     color: Colors.black
                                    //                         .withOpacity(0.6),
                                    //                     fontWeight:
                                    //                         FontWeight.normal,
                                    //                     decoration:
                                    //                         TextDecoration.none,
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             const SizedBox(height: 5),
                                    //             const SizedBox(
                                    //               width: 55,
                                    //               height: 4,
                                    //               child:
                                    //                   LinearProgressIndicator(
                                    //                 value: 0.4,
                                    //                 valueColor:
                                    //                     AlwaysStoppedAnimation<
                                    //                         Color>(Color(0xFF)),
                                    //                 backgroundColor:
                                    //                     Color(0xFFD9D9D9),
                                    //                 semanticsValue: '40%',
                                    //               ),
                                    //             )
                                    //           ],
                                    //         ),
                                    //         const Spacer(),
                                    //         Column(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.start,
                                    //           children: [
                                    //             InkWell(
                                    //               onTap: () {},
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .center,
                                    //                 children: [
                                    //                   SizedBox(
                                    //                     width: 16.65,
                                    //                     height: 10,
                                    //                     child: Image.asset(
                                    //                       'assets/images/addfood.png',
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   const SizedBox(width: 5),
                                    //                   const Text(
                                    //                     "Add food",
                                    //                     style: TextStyle(
                                    //                       fontFamily:
                                    //                           "source sans pro",
                                    //                       fontSize: 12,
                                    //                       color: Colors.black,
                                    //                       fontWeight:
                                    //                           FontWeight.normal,
                                    //                       decoration:
                                    //                           TextDecoration
                                    //                               .none,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //             const SizedBox(
                                    //               height: 18,
                                    //             ),
                                    //             InkWell(
                                    //               onTap: () {},
                                    //               child: Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .center,
                                    //                 children: [
                                    //                   const SizedBox(
                                    //                       width: 2.5),
                                    //                   SizedBox(
                                    //                     width: 12,
                                    //                     height: 11.928,
                                    //                     child: Image.asset(
                                    //                       'assets/images/orderfood.png',
                                    //                       fit: BoxFit.cover,
                                    //                     ),
                                    //                   ),
                                    //                   const SizedBox(width: 5),
                                    //                   const Text(
                                    //                     "Order food",
                                    //                     style: TextStyle(
                                    //                       fontFamily:
                                    //                           "source sans pro",
                                    //                       fontSize: 12,
                                    //                       color: Colors.black,
                                    //                       fontWeight:
                                    //                           FontWeight.normal,
                                    //                       decoration:
                                    //                           TextDecoration
                                    //                               .none,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         const Spacer(),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: (1 / 852) * screenHeight,
                        ),
                        DotsIndicator(
                          dotsCount: 5,
                          position: _currPageValue,
                          decorator: DotsDecorator(
                            size: const Size.square(6.0),
                            color: const Color(0xFFDDDDDC),
                            activeSize: const Size(12.0, 6.0),
                            activeColor: const Color(0xFFEFC8B1),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (10 / 852) * screenHeight,
                        ),
                      ],
                    ),
                    Container(
                      height: 115,
                      width: 353,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF).withOpacity(1.0),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFe8e8e8).withOpacity(0.7),
                            blurRadius: 5.0,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: const Color(0xFFe8e8e8).withOpacity(0.7),
                            blurRadius: 5.0,
                            offset: const Offset(-2, 0),
                          ),
                          BoxShadow(
                            color: const Color(0xFFe8e8e8).withOpacity(0.7),
                            blurRadius: 5.0,
                            offset: const Offset(2, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: CircularProgressIndicator(
                                        value: 0.4,
                                        strokeWidth: 15,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xFFEFC8B1)),
                                        backgroundColor: Color(0xFFD9D9D9),
                                        semanticsValue: '40%',
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "1900",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "Kcal",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: (20 / 393) * screenWidth,
                                      ),
                                      Text(
                                        "Enjoy a delicious",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(1.0),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        " ",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(1.0),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "2000",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(1.0),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        " ",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(1.0),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "calorie day!",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(1.0),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: (20 / 393) * screenWidth,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Protein",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                ":",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                " ",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              Text(
                                                "10%",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 8,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const SizedBox(
                                            width: 55,
                                            height: 4,
                                            child: LinearProgressIndicator(
                                              value: 0.4,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xFFEFC8B1)),
                                              backgroundColor:
                                                  Color(0xFFD9D9D9),
                                              semanticsValue: '40%',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 11,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Fats",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                ":",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                " ",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              Text(
                                                "10%",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 8,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const SizedBox(
                                            width: 55,
                                            height: 4,
                                            child: LinearProgressIndicator(
                                              value: 1,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xFFEFC8B1)),
                                              backgroundColor:
                                                  Color(0xFFD9D9D9),
                                              semanticsValue: '40%',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: (20 / 393) * screenWidth,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Carbs",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                ":",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                " ",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              Text(
                                                "10%",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 8,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const SizedBox(
                                            width: 55,
                                            height: 4,
                                            child: LinearProgressIndicator(
                                              value: 0.4,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xFFEFC8B1)),
                                              backgroundColor:
                                                  Color(0xFFD9D9D9),
                                              semanticsValue: '40%',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 11,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Fiber",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                ":",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              const Text(
                                                " ",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              Text(
                                                "10%",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 8,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const SizedBox(
                                            width: 55,
                                            height: 4,
                                            child: LinearProgressIndicator(
                                              value: 0.4,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xFF)),
                                              backgroundColor:
                                                  Color(0xFFD9D9D9),
                                              semanticsValue: '40%',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: (20 / 393) * screenWidth,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 16.65,
                                                  height: 10,
                                                  child: Image.asset(
                                                    'assets/images/addfood.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Add food",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 18,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 2.5),
                                                SizedBox(
                                                  width: 12,
                                                  height: 11.928,
                                                  child: Image.asset(
                                                    'assets/images/orderfood.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Order food",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: (25 / 852) * screenHeight,
                    ),
                    MealList(),
                    SizedBox(
                      height: (20 / 852) * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: (20 / 393) * screenWidth),
                        Text(
                          "Trackers",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: TrackingDialog,
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: (20 / 393) * screenWidth),
                      ],
                    ),
                    SizedBox(
                      height: (10 / 852) * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: (20 / 393) * screenWidth),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 166.5,
                            height: 86,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9D4BF).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(1.0),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Kg",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Current Weight",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "18",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 18,
                                            color:
                                                Colors.black.withOpacity(1.0),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: (20 / 393) * screenWidth),
                        Container(
                          width: 166.5,
                          height: 86,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3EFFF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF)
                                          .withOpacity(1.0),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                          'assets/images/drop.png',
                                          width: (8.66 / 393) * screenWidth,
                                          height: (12 / 852) * screenHeight),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Out of",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        " ",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "8",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        " ",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "glasses / day",
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
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: decrement,
                                        iconSize: 14,
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: increment,
                                        iconSize: 14,
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (10 / 852) * screenHeight,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AlertFullScreenDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  AlertFullScreenDialog({required this.onDialogDismissed});

  @override
  _AlertFullScreenDialogState createState() => _AlertFullScreenDialogState();
}

class _AlertFullScreenDialogState extends State<AlertFullScreenDialog> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void openPersonalDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return PersonalDialog(onDialogDismissed: toggleExpand);
        },
      );
      toggleExpand();
    }
  }

  void openGoalDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return GoalDialog(onDialogDismissed: toggleExpand);
        },
      );
      toggleExpand();
    }
  }

  void openRemaindersDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return RemainderDialog(onDialogDismissed: toggleExpand);
        },
      );
      toggleExpand();
    }
  }

  void openBreakdownDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return BreakdownDialog(onDialogDismissed: toggleExpand);
        },
      );
      toggleExpand();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        widget.onDialogDismissed();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: screenWidth,
            color: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 15),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.onDialogDismissed();
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    width: 353,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: (50 / 852) * screenHeight,
                              width: (50 / 393) * screenWidth,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/profile.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Yallapu V Madhuri",
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "Vishakapatnam",
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: openPersonalDialog,
                              child: Container(
                                width: 166.5,
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            'assets/images/pearson.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Personal",
                                      style: TextStyle(
                                        fontFamily: "source sans pro",
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "Information",
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
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: openBreakdownDialog,
                              child: Container(
                                width: 166.5,
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFD8EDF4).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            'assets/images/breakdown.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Meals",
                                      style: TextStyle(
                                        fontFamily: "source sans pro",
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "Breakdown",
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
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: openRemaindersDialog,
                              child: Container(
                                width: 166.5,
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFE1FFEB).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            'assets/images/clock.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Remainders",
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
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: openGoalDialog,
                              child: Container(
                                width: 166.5,
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFF4F3F2).withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            'assets/images/goal.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Goals",
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
