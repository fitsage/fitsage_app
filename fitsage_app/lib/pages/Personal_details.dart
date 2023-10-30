import 'package:flutter/material.dart';

class PersonalDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  PersonalDialog({required this.onDialogDismissed});

  @override
  _PersonalDialogState createState() => _PersonalDialogState();
}

class _PersonalDialogState extends State<PersonalDialog> {
  String selectedGender = '';

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
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'male';
                                });
                              },
                              child: Container(
                                width: (100 / 393) * screenWidth,
                                height: (58 / 852) * screenHeight,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: selectedGender == 'male'
                                        ? Colors.black.withOpacity(0.3)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/male.png",
                                        width: screenWidth * (30 / 393),
                                        height: screenHeight * (25.36 / 852),
                                      ),
                                      SizedBox(width: (4 / 393) * screenWidth),
                                      Text(
                                        'Male',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          color: const Color(0xFF514644)
                                              .withOpacity(1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: (16.5 / 393) * screenWidth),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'female';
                                });
                              },
                              child: Container(
                                width: (100 / 393) * screenWidth,
                                height: (58 / 852) * screenHeight,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: selectedGender == 'female'
                                        ? Colors.black.withOpacity(0.3)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/female.png",
                                        width: screenWidth * (30 / 393),
                                        height: screenHeight * (25.36 / 852),
                                      ),
                                      SizedBox(width: (4 / 393) * screenWidth),
                                      Text(
                                        'Female',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          color: const Color(0xFF514644)
                                              .withOpacity(1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: (16.5 / 393) * screenWidth),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'other';
                                });
                              },
                              child: Container(
                                width: (100 / 393) * screenWidth,
                                height: (58 / 852) * screenHeight,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: selectedGender == 'other'
                                        ? Colors.black.withOpacity(0.3)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Others',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF514644)
                                          .withOpacity(1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
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
