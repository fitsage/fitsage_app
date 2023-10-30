import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemainderDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  RemainderDialog({required this.onDialogDismissed});

  @override
  _RemainderDialogState createState() => _RemainderDialogState();
}

class _RemainderDialogState extends State<RemainderDialog> {
  bool isSwitched = false;
  bool isSwitchedsleep = false;
  bool isSwitchedWater = false;
  bool? isBreakfast = true;
  TimeOfDay time = const TimeOfDay(
    hour: 9,
    minute: 0,
  );
  bool? isSnack1 = false;
  TimeOfDay snack1Time = const TimeOfDay(hour: 11, minute: 0);
  bool? isSnack2 = false;
  TimeOfDay snack2Time = const TimeOfDay(hour: 17, minute: 30);
  bool? isLunch = true;
  TimeOfDay lunchTime = const TimeOfDay(hour: 13, minute: 0);
  bool? isDinner = true;
  TimeOfDay dinnerTime = const TimeOfDay(hour: 20, minute: 30);

  bool? isWake = true;
  TimeOfDay WakeTime = const TimeOfDay(hour: 7, minute: 0);
  bool? isSleep = true;
  TimeOfDay SleepTime = const TimeOfDay(hour: 20, minute: 0);

  bool? isWatertimes = false;
  bool? isWater = true;

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
                  child: Container(
                    width: 353,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            if (!isSwitched) {
                              setState(() {
                                isSwitched = !isSwitched;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSwitched
                                  ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: !isSwitched
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: 23.33,
                                      height: 14,
                                      child: Image.asset(
                                        'assets/images/addfood.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Meal Reminder",
                                      style: TextStyle(
                                        fontFamily: "source sans pro",
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale:
                                          0.7, // Adjust the scale factor as needed to decrease the size
                                      child: CupertinoSwitch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                          });
                                        },
                                        activeColor: const Color(0xFFF4F3F2)
                                            .withOpacity(1.0),
                                        trackColor: CupertinoColors.systemGrey
                                            .withOpacity(0.8),
                                        thumbColor: !isSwitched
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFFEFC8B1),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                    visible: !isSwitched,
                                    child: const SizedBox(height: 10)),
                                Visibility(
                                  visible: isSwitched,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isBreakfast,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitched
                                                  ? (value) {
                                                      setState(() {
                                                        isBreakfast = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Breakfast",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitched
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: time,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        time = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isSnack1,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitched
                                                  ? (value) {
                                                      setState(() {
                                                        isSnack1 = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Snack 1",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitched
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: snack1Time,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        snack1Time = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${snack1Time.hourOfPeriod}:${snack1Time.minute.toString().padLeft(2, '0')} ${snack1Time.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isLunch,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitched
                                                  ? (value) {
                                                      setState(() {
                                                        isLunch = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Lunch",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitched
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: lunchTime,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        lunchTime = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${lunchTime.hourOfPeriod}:${lunchTime.minute.toString().padLeft(2, '0')} ${lunchTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isSnack2,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitched
                                                  ? (value) {
                                                      setState(() {
                                                        isSnack2 = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Snack 2",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitched
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: snack2Time,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        snack2Time = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${snack2Time.hourOfPeriod}:${snack2Time.minute.toString().padLeft(2, '0')} ${snack2Time.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isDinner,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitched
                                                  ? (value) {
                                                      setState(() {
                                                        isDinner = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Dinner",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitched
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: dinnerTime,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        dinnerTime = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${dinnerTime.hourOfPeriod}:${dinnerTime.minute.toString().padLeft(2, '0')} ${dinnerTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            if (!isSwitchedsleep) {
                              setState(() {
                                isSwitchedsleep = !isSwitchedsleep;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSwitchedsleep
                                  ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: !isSwitchedsleep
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: 21,
                                      height: 20,
                                      child: Image.asset(
                                        'assets/images/Moon.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Sleep Reminder",
                                      style: TextStyle(
                                        fontFamily: "source sans pro",
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale:
                                          0.7, // Adjust the scale factor as needed to decrease the size
                                      child: CupertinoSwitch(
                                        value: isSwitchedsleep,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitchedsleep = value;
                                          });
                                        },
                                        activeColor: const Color(0xFFF4F3F2)
                                            .withOpacity(1.0),
                                        trackColor: CupertinoColors.systemGrey
                                            .withOpacity(0.8),
                                        thumbColor: !isSwitchedsleep
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFFEFC8B1),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                    visible: !isSwitchedsleep,
                                    child: const SizedBox(height: 10)),
                                Visibility(
                                  visible: isSwitchedsleep,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isWake,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitchedsleep
                                                  ? (value) {
                                                      setState(() {
                                                        isWake = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Wake Up",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitchedsleep
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: WakeTime,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        WakeTime = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${WakeTime.hourOfPeriod}:${WakeTime.minute.toString().padLeft(2, '0')} ${WakeTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isSleep,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitchedsleep
                                                  ? (value) {
                                                      setState(() {
                                                        isSleep = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Sleep Time",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitchedsleep
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: SleepTime,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        SleepTime = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${SleepTime.hourOfPeriod}:${SleepTime.minute.toString().padLeft(2, '0')} ${SleepTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            if (!isSwitchedWater) {
                              setState(() {
                                isSwitchedWater = !isSwitchedWater;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSwitchedWater
                                  ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: !isSwitchedWater
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: 11.5,
                                      height: 16,
                                      child: Image.asset(
                                        'assets/images/drop.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Water Reminder",
                                      style: TextStyle(
                                        fontFamily: "source sans pro",
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale:
                                          0.7, // Adjust the scale factor as needed to decrease the size
                                      child: CupertinoSwitch(
                                        value: isSwitchedWater,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitchedWater = value;
                                          });
                                        },
                                        activeColor: const Color(0xFFF4F3F2)
                                            .withOpacity(1.0),
                                        trackColor: CupertinoColors.systemGrey
                                            .withOpacity(0.8),
                                        thumbColor: !isSwitchedsleep
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFFEFC8B1),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                    visible: !isSwitchedWater,
                                    child: const SizedBox(height: 10)),
                                Visibility(
                                  visible: isSwitchedWater,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isWater,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitchedWater
                                                  ? (value) {
                                                      setState(() {
                                                        isWater = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Wake Up",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitchedWater
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: WakeTime,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        WakeTime = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${WakeTime.hourOfPeriod}:${WakeTime.minute.toString().padLeft(2, '0')} ${WakeTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: isWatertimes,
                                              activeColor:
                                                  const Color(0xFFEFC8B1),
                                              onChanged: isSwitchedWater
                                                  ? (value) {
                                                      setState(() {
                                                        isWatertimes = value;
                                                      });
                                                    }
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Sleep Time",
                                            style: TextStyle(
                                              fontFamily: "source sans pro",
                                              fontSize: 18,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: isSwitchedWater
                                                ? () async {
                                                    TimeOfDay? newTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: SleepTime,
                                                    );
                                                    if (newTime != null) {
                                                      setState(() {
                                                        SleepTime = newTime;
                                                      });
                                                    }
                                                  }
                                                : null,
                                            child: Text(
                                              "${SleepTime.hourOfPeriod}:${SleepTime.minute.toString().padLeft(2, '0')} ${SleepTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 18,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
