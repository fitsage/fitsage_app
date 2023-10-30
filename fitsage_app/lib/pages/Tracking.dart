import 'package:fitsage_app/custom_widgets/Add_weight_alert.dart';
import 'package:fitsage_app/custom_widgets/Bar_chart.dart';
import 'package:fitsage_app/custom_widgets/Time_Tile.dart';
import 'package:fitsage_app/custom_widgets/confetti.dart';
import 'package:fitsage_app/custom_widgets/line_Chart.dart';
import 'package:fitsage_app/views/am_pm.dart';
import 'package:fitsage_app/views/hours.dart';
import 'package:fitsage_app/views/minutes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Tracking extends StatefulWidget {
  String selectedOption;

  Tracking({Key? key, required this.selectedOption}) : super(key: key);

  @override
  _TrackingState createState() =>
      _TrackingState(selectedOption: selectedOption);
}

class _TrackingState extends State<Tracking> {
  late DateTime selectedDate;
  String selectedOption;
  int selectedHourIndex = 0;
  int selectedMinuteIndex = 0;
  int selectedAmPmIndex = 0;
  late FixedExtentScrollController _controller;

  _TrackingState({required this.selectedOption});

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _controller = FixedExtentScrollController(initialItem: 0);
    _startInitialScrolling();
    weightMap["24 Oct 2023"] = "70";
    weightMap["23 Oct 2023"] = "68";
    weightMap["22 Oct 2023"] = "66";
  }

  void _startInitialScrolling() async {
    int hoursItemCount = 60;
    for (int i = 0; i < hoursItemCount; i++) {
      await Future.delayed(const Duration(milliseconds: 1));
      _controller.jumpToItem(i);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  // text controller
  final _controllerweight = TextEditingController();

  Map<String, String?> weightMap = {};

  void saveNewTask() {
    setState(() {
      final currentDate =
          "${DateTime.now().day} ${DateFormat.MMM().format(DateTime.now())} ${DateTime.now().year}";
      final weightValue = _controllerweight.text ??
          "Default Weight"; // Provide a default value if the text is null
      weightMap[currentDate] =
          weightValue; // Store weight with the current date
      _controllerweight.clear(); // Clear the text field after saving
    });
    Navigator.of(context).pop();
  }

  void createnewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controllerweight,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  Widget _gestureContainer(String text) {
    bool isSelected = selectedOption == text;

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Opacity(
                          opacity: 0.60,
                          child: SizedBox(
                            width: 15,
                            height: 15,
                            child: Image.asset(
                              'assets/images/share.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    const SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {},
                        child: const Opacity(
                          opacity: 0.60,
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                        )),
                  ],
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
              _gestureContainer('Calories'),
              const Spacer(),
              _gestureContainer('Weight'),
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
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 166.5,
                                height: 86,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFF9D4BF).withOpacity(0.4),
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
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/edit.png',
                                              width: (10 / 393) * screenWidth,
                                              height: (10 / 852) * screenHeight,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                color: Colors.black
                                                    .withOpacity(0.6),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                color: Colors.black
                                                    .withOpacity(1.0),
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
                                color: const Color(0xFFF4F3F2),
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/edit.png',
                                            width: (10 / 393) * screenWidth,
                                            height: (10 / 852) * screenHeight,
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
                                            "Target Weight",
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
                                            "58",
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
                          ],
                        ),
                        const SizedBox(height: 40),
                        const SizedBox(
                          width: 333,
                          height: 180,
                          child: LineChartSample2(),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: ListView.builder(
                            key: UniqueKey(),
                            itemCount: weightMap.length,
                            itemBuilder: (context, index) {
                              final dates = weightMap.keys.toList();
                              final date = dates[index];
                              final weight = weightMap[date] ??
                                  "Default Weight"; // Provide a default value if the weight is null
                              return Timetile(
                                isFirst: index == 0,
                                isLast: index == weightMap.length - 1,
                                isPast: true,
                                child1: weight,
                                child2: date,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Positioned(
                      bottom:
                          16, // Adjust the value to change the vertical position
                      right:
                          0, // Adjust the value to change the horizontal position
                      child: FloatingActionButton(
                        onPressed: createnewTask,
                        child: Icon(Icons.add),
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
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: (count / target * 100) >= 100
                                    ? const Text(
                                        "Goal Achieved",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      )
                                    : Text(
                                        "${(count / target * 100).toStringAsFixed(0)}%",
                                        style: const TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
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
