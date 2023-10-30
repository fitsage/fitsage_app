import 'package:flutter/material.dart';

class MealList extends StatefulWidget {
  @override
  _MealListState createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void openFullScreenDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return FullScreenDialog(onDialogDismissed: toggleExpand);
        },
      );
      toggleExpand();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Container(
              //   width: 273,
              //   height: 258,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFFFFFFF),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              // ),
              // Container(
              //   width: 293,
              //   height: 258,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFFFFFFF),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              // ),
              // Container(
              //   width: 313,
              //   height: 253,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFFFFFFF),
              //     borderRadius: BorderRadius.circular(15),
              //     boxShadow: [
              //       BoxShadow(
              //         color: const Color(0xFFe8e8e8).withOpacity(0.7),
              //         blurRadius: 5.0,
              //         offset: const Offset(0, 4),
              //       ),
              //       BoxShadow(
              //         color: const Color(0xFFe8e8e8).withOpacity(0.7),
              //         blurRadius: 5.0,
              //         offset: const Offset(-2, 0),
              //       ),
              //       BoxShadow(
              //         color: const Color(0xFFe8e8e8).withOpacity(0.7),
              //         blurRadius: 5.0,
              //         offset: const Offset(2, 0),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: 333,
              //   height: 253,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFFFFFFF),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              // ),
              Container(
                width: 353,
                height: 248,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
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
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Breakfast",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 16,
                                color: Colors.black.withOpacity(1.0),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "250 kcal",
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFFFFFFF),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 0.4,
                                ),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: (25 / 393) * screenWidth,
                            height: (25 / 852) * screenHeight,
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        Container(
                          width: 200,
                          height: 117,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                          ),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                width: 200,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF4F2F2),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/images/banana.png',
                                            width: (16.15 / 393) * screenWidth,
                                            height: (10 / 852) * screenHeight),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                      width: 160,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Banana ",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 10,
                                              color:
                                                  Colors.black.withOpacity(1.0),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "2 medium",
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
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 200,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF4F2F2),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/images/banana.png',
                                            width: (16.15 / 393) * screenWidth,
                                            height: (10 / 852) * screenHeight),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                      width: 160,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Banana ",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 10,
                                              color:
                                                  Colors.black.withOpacity(1.0),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "2 medium",
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
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 200,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF4F2F2),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/images/banana.png',
                                            width: (16.15 / 393) * screenWidth,
                                            height: (10 / 852) * screenHeight),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                      width: 160,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Banana ",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 10,
                                              color:
                                                  Colors.black.withOpacity(1.0),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "2 medium",
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
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 200,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF4F2F2),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/images/banana.png',
                                            width: (16.15 / 393) * screenWidth,
                                            height: (10 / 852) * screenHeight),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                      width:
                                          160, // Adjust the width to accommodate both the icon and text
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Banana",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 10,
                                              color:
                                                  Colors.black.withOpacity(1.0),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "2 medium",
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 117,
                          child: ClipOval(
                            child: VerticalDivider(
                              color: Colors.grey.withOpacity(0.4),
                              thickness: 1,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 90,
                          height: 117,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Healthy",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Score",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "8/10",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Protein",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "90g",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Carbs",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "90g",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fats",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "90g",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fiber",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "90g",
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: 323,
                      child: ClipOval(
                        child: Divider(
                          color: Colors.grey.withOpacity(0.4),
                          thickness: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: 353,
                      height: 31,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Container(
                            width: 320,
                            height: 31,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Center(
                              child: Text(
                                "A ripe banana for breakfast quick energy, satisfying. A ripe banana for breakfast quick energy A ripe banana for breakfast quick energy A ripe banana for breakfast quick energy",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 8,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  final VoidCallback onDialogDismissed;

  FullScreenDialog({required this.onDialogDismissed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        onDialogDismissed();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: screenWidth,
            color: const Color(0xFFF9F8F8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 15),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDialogDismissed();
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Center(
                        child: Container(
                          width: 353.0,
                          child: MealContainer(width: 353.0, height: 236.0),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 353.0,
                          child: MealContainer(width: 353.0, height: 236.0),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 353.0,
                          child: MealContainer(width: 353.0, height: 236.0),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 353.0,
                          child: MealContainer(width: 353.0, height: 236.0),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 353.0,
                          child: MealContainer(width: 353.0, height: 236.0),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
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

class MealContainer extends StatelessWidget {
  final double width;
  final double height;

  MealContainer({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
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
    );
  }
}
