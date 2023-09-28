import 'package:fitsage_app/pages/Bar_chart.dart';
import 'package:fitsage_app/views/am_pm.dart';
import 'package:fitsage_app/views/hours.dart';
import 'package:fitsage_app/views/minutes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedOption = 'Calories';
    _controller = FixedExtentScrollController(initialItem: 0);
    _startInitialScrolling();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (dateTime != null) {
      setState(() {
        selectedDate = dateTime;
      });
    }
  }

  String selectedOption = ''; // Store the selected option

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

  Widget _gestureContainer(String text) {
    bool isSelected =
        selectedOption == text; // Check if this option is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text;
        });
      },
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFFEFC8B1).withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color:
                isSelected ? Colors.black.withOpacity(0.3) : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "source sans pro",
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  int selectedHourIndex = 0;
  int selectedMinuteIndex = 0;
  int selectedAmPmIndex = 0;
  late FixedExtentScrollController _controller;

  void _startInitialScrolling() async {
    for (int i = 0; i <= 60; i++) {
      await Future.delayed(const Duration(milliseconds: 1));
      _controller.jumpToItem(i);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double target = 8;

    String formattedDate = DateFormat('d').format(selectedDate);
    String formattedMonth = DateFormat('MMMM').format(selectedDate);
    String formattedYear = DateFormat('y').format(selectedDate);

    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          SizedBox(
            height: (66 / 852) * screenHeight,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate.isToday
                          ? "Today, $formattedDate $formattedMonth"
                          : "$formattedDate $formattedMonth $formattedYear",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(
                    'assets/images/edit.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: (14 / 852) * screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: SizedBox(
                  width: 16,
                  height: 8,
                  child: Image.asset(
                    'assets/images/down.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          //
          SizedBox(
            height: (30 / 852) * screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (20 / 852) * screenHeight,
              ),
              _gestureContainer(
                  'Calories'), // Use the custom gesture container widget
              const Spacer(),
              _gestureContainer(
                  'Weight'), // Use the custom gesture container widget
              const Spacer(),
              _gestureContainer(
                  'Water'), // Use the custom gesture container widget
              const Spacer(),
              _gestureContainer('Macros'),
              // Use the custom gesture container widget
              SizedBox(
                width: (20 / 852) * screenHeight,
              ),
            ],
          ),
          SizedBox(
            height: (20 / 852) * screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (40 / 852) * screenHeight,
              ),
              _gestureContainer(
                  'Steps'), // Use the custom gesture container widget
              const Spacer(),
              _gestureContainer(
                  'Sugar'), // Use the custom gesture container widget
              const Spacer(),
              _gestureContainer(
                  'Caffeen'), // Use the custom gesture container widget

              SizedBox(
                width: (40 / 852) * screenHeight,
              ),
            ],
          ),
          SizedBox(
            height: (20 / 852) * screenHeight,
          ),
          if (selectedOption == 'Calories')
            Expanded(
              child: Container(
                width: 353,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Remaining",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "1277 / 1500 kcal",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 24,
                        color: Colors.black.withOpacity(1.0),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meal Type",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(1.0),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Breakfast",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Snack 1",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Lunch",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Snack 2",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Dinner",
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
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remaining cal",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(1.0),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "200 / 500kcal",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "200 / 500kcal",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "200 / 500kcal",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "200 / 500kcal",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "200 / 500kcal",
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
                        const SizedBox(width: 40),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Last 7 Days",
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
                      ],
                    ),
                    SizedBox(
                      height: (20 / 852) * screenHeight,
                    ),
                    Container(
                      width: 353,
                      height: 180,
                      child: BarChartSample3(
                        toyValues: [8, 10, 14, 15, 13, 10, 16],
                        horizontalLineY:
                            target, // Specify the y-coordinate here
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (selectedOption == 'Weight')
            Expanded(
              child: Container(
                width: 353,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Current Weight",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "65 Kg",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 24,
                        color: Colors.black.withOpacity(1.0),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 330,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top:
                                75, // Adjust this value to center the grey container vertically
                            child: Container(
                              width: 210,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF4F3F2).withOpacity(1.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Hours wheel
                              SizedBox(
                                width: 60,
                                child: ListWheelScrollView.useDelegate(
                                  controller: _controller,
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedHourIndex = index;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 272,
                                    builder: (context, index) {
                                      final isSelected =
                                          index == selectedHourIndex;
                                      return MyHours(
                                        hours: index,
                                        fontSize: 35,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedMinuteIndex = index;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 10,
                                    builder: (context, index) {
                                      final isSelected =
                                          index == selectedMinuteIndex;
                                      return MyMinutes(
                                        mins: index,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // AM or PM
                              SizedBox(
                                width: 60,
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedAmPmIndex = index;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 2,
                                    builder: (context, index) {
                                      final isSelected =
                                          index == selectedAmPmIndex;
                                      if (index == 0) {
                                        return AmPm(
                                          isItAm: true,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        );
                                      } else {
                                        return AmPm(
                                          isItAm: false,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (selectedOption == 'Water')
            Expanded(
              child: Container(
                width: 353,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: LiquidLinearProgressIndicator(
                          value: (count / target), // Defaults to 0.5.
                          valueColor: AlwaysStoppedAnimation(
                              const Color(0xFFBFDBFF).withOpacity(1.0)),
                          backgroundColor: Colors.white,
                          borderColor: const Color(0xFFBFDBFF).withOpacity(1.0),
                          borderWidth: 3.0,
                          borderRadius: 150.0,
                          direction: Axis.vertical,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "(1000ml)",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "${(count / target * 100).toStringAsFixed(0)}%",
                                style: const TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Out of",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Text(
                              " ",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Text(
                              "8",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Text(
                              " ",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Text(
                              "glasses ",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              "/ day",
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFEFC8B1).withOpacity(0.2),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: decrement,
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          count.toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFEFC8B1).withOpacity(0.2),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: increment,
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (20 / 852) * screenHeight,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Last 7 Days",
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
                      ],
                    ),
                    SizedBox(
                      height: (20 / 852) * screenHeight,
                    ),
                    Container(
                      width: 353,
                      height: 180,
                      child: BarChartSample3(
                        toyValues: [8, 10, 14, 15, 13, 10, 16],
                        horizontalLineY:
                            target, // Specify the y-coordinate here
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (selectedOption == 'Macros')
            Expanded(
              child: Container(
                width: 353,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFC8B1).withOpacity(0.2),
                ),
                child: Text(
                  "Macros!",
                  style: TextStyle(
                    fontFamily: "source sans pro",
                    fontSize: 12,
                    color: Colors.black.withOpacity(1.0),
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }
}
