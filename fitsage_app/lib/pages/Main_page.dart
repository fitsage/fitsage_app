import 'package:fitsage_app/pages/MealList.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            padding: EdgeInsets.only(top: (55 / 852) * screenHeight),
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
                      Container(
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
                      height: (16 / 852) * screenHeight,
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
                      height: (30 / 852) * screenHeight,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 152,
                          width: 363,
                          child: PageView(
                            controller: pageController,
                            children: List.generate(5, (index) {
                              return Container(
                                height: 152,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 114,
                                      width: 363,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(1.0),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFe8e8e8)
                                                .withOpacity(0.7),
                                            blurRadius: 5.0,
                                            offset: const Offset(0, 4),
                                          ),
                                          BoxShadow(
                                            color: const Color(0xFFe8e8e8)
                                                .withOpacity(0.7),
                                            blurRadius: 5.0,
                                            offset: const Offset(-2, 0),
                                          ),
                                          BoxShadow(
                                            color: const Color(0xFFe8e8e8)
                                                .withOpacity(0.7),
                                            blurRadius: 5.0,
                                            offset: const Offset(2, 0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 30),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: 0.4,
                                                        strokeWidth: 8,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xFFEFC8B1)),
                                                        backgroundColor:
                                                            Color(0xFFD9D9D9),
                                                        semanticsValue: '40%',
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "1900",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "source sans pro",
                                                            fontSize: 8,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Kcal",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "source sans pro",
                                                            fontSize: 8,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.6),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: (25 / 393) *
                                                            screenWidth,
                                                      ),
                                                      Text(
                                                        "Enjoy a delicious",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "source sans pro",
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(1.0),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      Text(
                                                        " ",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "source sans pro",
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(1.0),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      Text(
                                                        "2000",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "source sans pro",
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(1.0),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      Text(
                                                        " ",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "source sans pro",
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(1.0),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      Text(
                                                        "calorie day!",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "source sans pro",
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(1.0),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 13,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: (25 / 393) *
                                                            screenWidth,
                                                      ),
                                                      SizedBox(
                                                        width: (11.31 / 393) *
                                                            screenWidth,
                                                        height: (12 / 852) *
                                                            screenHeight,
                                                        child: Opacity(
                                                          opacity: 0.8,
                                                          child: Image.asset(
                                                              'assets/images/planner.png',
                                                              width: (11.31 /
                                                                      393) *
                                                                  screenWidth,
                                                              height: (12 /
                                                                      852) *
                                                                  screenHeight),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      SizedBox(
                                                        width: (12 / 393) *
                                                            screenWidth,
                                                        height: (12 / 852) *
                                                            screenHeight,
                                                        child: Opacity(
                                                          opacity: 0.8,
                                                          child: Image.asset(
                                                              'assets/images/tracking.png',
                                                              width: (12 /
                                                                      393) *
                                                                  screenWidth,
                                                              height: (12 /
                                                                      852) *
                                                                  screenHeight),
                                                        ),
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
                                      height: (11 / 852) * screenHeight,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 76,
                                        width: 293,
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xFFe8e8e8)
                                                .withOpacity(0.6),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Spacer(),
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
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      ":",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      " ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    Text(
                                                      "10%",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
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
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      ":",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      " ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    Text(
                                                      "10%",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Color(0xFFEFC8B1)),
                                                    backgroundColor:
                                                        Color(0xFFD9D9D9),
                                                    semanticsValue: '40%',
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
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
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      ":",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      " ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    Text(
                                                      "10%",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
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
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      ":",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Text(
                                                      " ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    Text(
                                                      "10%",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(Color(0xFF)),
                                                    backgroundColor:
                                                        Color(0xFFD9D9D9),
                                                    semanticsValue: '40%',
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
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
                                                        MainAxisAlignment
                                                            .center,
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
                                                              TextDecoration
                                                                  .none,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                          width: 2.5),
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
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: (5 / 852) * screenHeight,
                        ),
                        DotsIndicator(
                          dotsCount: 5,
                          position: _currPageValue,
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            color: const Color(0xFFDDDDDC),
                            activeSize: const Size(18.0, 9.0),
                            activeColor: const Color(0xFFEFC8B1),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (8 / 852) * screenHeight,
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
                          onTap: () {},
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
                        Container(
                          width: 163.5,
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
                                    style: TextStyle(fontSize: 18),
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
                        SizedBox(width: (20 / 393) * screenWidth),
                        Container(
                          width: 163.5,
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
                                        "Current Weight",
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
                                children: [
                                  const SizedBox(width: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "18",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 18,
                                          color: Colors.black.withOpacity(1.0),
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
