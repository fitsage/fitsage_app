import 'package:flutter/material.dart';

class GoalDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  GoalDialog({required this.onDialogDismissed});

  @override
  _GoalDialogState createState() => _GoalDialogState();
}

class _GoalDialogState extends State<GoalDialog> {
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
                        Text(
                          "Out",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 18,
                            color: Colors.black,
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
          ),
        ),
      ),
    );
  }
}
