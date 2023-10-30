import 'package:flutter/material.dart';

class BreakdownDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  BreakdownDialog({required this.onDialogDismissed});

  @override
  _BreakdownDialogState createState() => _BreakdownDialogState();
}

class _BreakdownDialogState extends State<BreakdownDialog> {
  @override
  Widget build(BuildContext context) {
    TextEditingController breakfastController = TextEditingController();
    breakfastController.text = '25';

// TextEditingController for lunch
    TextEditingController Snack1Controller = TextEditingController();
    Snack1Controller.text = '15';

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
                        const Text(
                          "Meal breakdown",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Breakfast in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: breakfastController,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Snack-1 in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Lunch in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Snack-2 in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Dinner in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 15),
                        const Text(
                          "Macro Breakdown",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "carbs in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: breakfastController,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Protein in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Fats in %",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Fiber in gm",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: Snack1Controller,
                          cursorColor: const Color(0xFF514644),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF514644),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: const TextStyle(fontSize: 18),
                            contentPadding: const EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixText: 'Calories : 900Kcal',
                            suffixStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(height: 20),
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
