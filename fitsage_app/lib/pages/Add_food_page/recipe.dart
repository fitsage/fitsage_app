import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeDialog extends StatefulWidget {
  final VoidCallback? onDialogDismissed;
  final String searchText;
  final Function(Map<String, String>) sendDetails;

  RecipeDialog({
    required this.searchText,
    required this.sendDetails,
    this.onDialogDismissed,
  });

  @override
  _RecipeDialogState createState() => _RecipeDialogState();
}

class _RecipeDialogState extends State<RecipeDialog> {
  void addFood() {
    Map<String, String> mealDetails = {
      "mealName": widget.searchText,
      "quantity": count.toString(),
      "type": selectedGender,
      "cal": "230",
    };

    widget.sendDetails(mealDetails);

    Navigator.of(context).pop();
    widget.onDialogDismissed?.call();
  }

  String selectedGender = 'Small';
  int count = 1;

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        widget.onDialogDismissed?.call();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: screenWidth,
          color: const Color(0xFFFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: (30 / 852) * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: (20 / 393) * screenWidth),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      widget.onDialogDismissed?.call();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/Arrow.svg",
                      width: 16,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: addFood,
                    child: const Text(
                      "Add Food",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(width: (20 / 393) * screenWidth),
                ],
              ),
              SizedBox(height: (20 / 852) * screenHeight),
              Stack(
                children: [
                  Positioned(
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF4F3F2).withOpacity(0.7),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/Fitmeal.svg",
                            height: (40 / 852) * screenHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 5,
                    child: SvgPicture.asset(
                      "assets/icons/report.svg",
                      height: (18 / 852) * screenHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(height: (5 / 852) * screenHeight),
              Text(
                widget.searchText,
                style: const TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: (20 / 852) * screenHeight),
              const Text(
                "Quantity",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: (5 / 852) * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: decrement,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFC8B1).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: decrement,
                          iconSize: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    selectedGender == 'Grams'
                        ? "${count.toString()}g"
                        : "${count.toString()}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: "source sans pro",
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: increment,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFC8B1).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: increment,
                          iconSize: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: (10 / 852) * screenHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: (20 / 393) * screenWidth),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Small';
                      });
                    },
                    child: Container(
                      width: (73.25 / 393) * screenWidth,
                      height: (50 / 852) * screenHeight,
                      decoration: BoxDecoration(
                        color: selectedGender == 'Small'
                            ? const Color(0xFFEFC8B1).withOpacity(0.2)
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                        border: selectedGender == 'Small'
                            ? null
                            : Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 0.5,
                              ),
                      ),
                      child: Center(
                        child: Text(
                          'Small',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            color: const Color(0xFF514644).withOpacity(1),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: (20 / 393) * screenWidth),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Medium';
                      });
                    },
                    child: Container(
                      width: (73.25 / 393) * screenWidth,
                      height: (50 / 852) * screenHeight,
                      decoration: BoxDecoration(
                        color: selectedGender == 'Medium'
                            ? const Color(0xFFEFC8B1).withOpacity(0.2)
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                        border: selectedGender == 'Medium'
                            ? null
                            : Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 0.5,
                              ),
                      ),
                      child: Center(
                        child: Text(
                          'Medium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            color: const Color(0xFF514644).withOpacity(1),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: (20 / 393) * screenWidth),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Large';
                      });
                    },
                    child: Container(
                      width: (73.25 / 393) * screenWidth,
                      height: (50 / 852) * screenHeight,
                      decoration: BoxDecoration(
                        color: selectedGender == 'Large'
                            ? const Color(0xFFEFC8B1).withOpacity(0.2)
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                        border: selectedGender == 'Large'
                            ? null
                            : Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 0.5,
                              ),
                      ),
                      child: Center(
                        child: Text(
                          'Large',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            color: const Color(0xFF514644).withOpacity(1),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: (20 / 393) * screenWidth),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Grams';
                      });
                    },
                    child: Container(
                      width: (73.25 / 393) * screenWidth,
                      height: (50 / 852) * screenHeight,
                      decoration: BoxDecoration(
                        color: selectedGender == 'Grams'
                            ? const Color(0xFFEFC8B1).withOpacity(0.2)
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                        border: selectedGender == 'Grams'
                            ? null
                            : Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 0.5,
                              ),
                      ),
                      child: Center(
                        child: Text(
                          'Grams',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            color: const Color(0xFF514644).withOpacity(1),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: (20 / 393) * screenWidth),
                ],
              ),
              SizedBox(height: (20 / 852) * screenHeight),
              Expanded(
                child: SizedBox(
                  width: (353 / 393) * screenWidth,
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: (90 / 852) * screenHeight,
                              width: (143 / 393) * screenWidth,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF).withOpacity(1.0),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFe8e8e8)
                                        .withOpacity(0.7),
                                    blurRadius: 5.0,
                                    offset: const Offset(0, 2),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  "230 cal",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: (5 / 393) *
                                                        screenWidth),
                                                Text(
                                                  "80g",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontSize: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    (10 / 852) * screenHeight),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Breakfast",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontSize: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    (3 / 852) * screenHeight),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "11%",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontSize: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: (5 / 393) *
                                                        screenWidth),
                                                SizedBox(
                                                  width:
                                                      (90 / 393) * screenWidth,
                                                  height:
                                                      (4 / 852) * screenHeight,
                                                  child:
                                                      const LinearProgressIndicator(
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(width: (20 / 393) * screenWidth),
                          Container(
                            height: (90 / 852) * screenHeight,
                            width: (190 / 393) * screenWidth,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF).withOpacity(1.0),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFFe8e8e8).withOpacity(0.7),
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 2),
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xFFe8e8e8).withOpacity(0.7),
                                  blurRadius: 5.0,
                                  offset: const Offset(-2, 0),
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xFFe8e8e8).withOpacity(0.7),
                                  blurRadius: 5.0,
                                  offset: const Offset(2, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          ":",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          " ",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "80g",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 8,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
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
                                        backgroundColor: Color(0xFFD9D9D9),
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
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          ":",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          " ",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "80g",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 8,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
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
                                        backgroundColor: Color(0xFFD9D9D9),
                                        semanticsValue: '40%',
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          ":",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          " ",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "80g",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 8,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
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
                                        backgroundColor: Color(0xFFD9D9D9),
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
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          ":",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text(
                                          " ",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "80g",
                                          style: TextStyle(
                                            fontFamily: "source sans pro",
                                            fontSize: 8,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
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
                                        backgroundColor: Color(0xFFD9D9D9),
                                        semanticsValue: '40%',
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: (20 / 852) * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Macro Nutrients analysis",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 8,
                            child: Image.asset(
                              'assets/images/down.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                      SizedBox(height: (10 / 852) * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 8,
                            child: Image.asset(
                              'assets/images/down.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                      SizedBox(height: (10 / 852) * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Preparation",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 8,
                            child: Image.asset(
                              'assets/images/down.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                      SizedBox(height: (10 / 852) * screenHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "About Food",
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 8,
                            child: Image.asset(
                              'assets/images/down.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                      // SizedBox(height: (10 / 852) * screenHeight),
                      // Text(
                      //   "Combine with",
                      //   style: TextStyle(
                      //     fontFamily: "source sans pro",
                      //     fontSize: 14,
                      //     color: Colors.black.withOpacity(0.6),
                      //     fontWeight: FontWeight.normal,
                      //     decoration: TextDecoration.none,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
