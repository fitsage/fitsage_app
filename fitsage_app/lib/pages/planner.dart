import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class FitMeal extends StatefulWidget {
  const FitMeal({Key? key}) : super(key: key);

  @override
  _FitMealState createState() => _FitMealState();
}

class _FitMealState extends State<FitMeal> with TickerProviderStateMixin {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String formattedDate = DateFormat('d').format(selectedDate);
    String formattedMonth = DateFormat('MMMM').format(selectedDate);
    String formattedYear = DateFormat('y').format(selectedDate);

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: (66 / 852) * screenHeight,
          ),
          Stack(
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
                      style: const TextStyle(
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
                      onTap: openFullScreenDialog,
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                          'assets/images/setting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: openAlertFullScreenDialog,
                      child: SizedBox(
                        width: 16.88,
                        height: 15,
                        child: Image.asset(
                          'assets/images/alert.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
          SizedBox(
            height: (30 / 852) * screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (20 / 852) * screenHeight,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFC8B1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (10 / 393) * screenWidth,
                            height: (10 / 852) * screenHeight,
                            child: Opacity(
                              opacity: 0.8,
                              child: Image.asset('assets/images/tracking.png',
                                  width: (10 / 393) * screenWidth,
                                  height: (10 / 852) * screenHeight),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Analytics",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFC8B1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (10 / 393) * screenWidth,
                            height: (10 / 852) * screenHeight,
                            child: Opacity(
                              opacity: 0.8,
                              child: Image.asset('assets/images/orderfood.png',
                                  width: (10 / 393) * screenWidth,
                                  height: (10 / 852) * screenHeight),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Meal Plan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFC8B1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (16.65 / 393) * screenWidth,
                            height: (10 / 852) * screenHeight,
                            child: Opacity(
                              opacity: 0.8,
                              child: Image.asset('assets/images/addfood.png',
                                  width: (16.65 / 393) * screenWidth,
                                  height: (10 / 852) * screenHeight),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Saved Recipes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: (20 / 852) * screenHeight,
              ),
            ],
          ),
          SizedBox(
            height: (30 / 852) * screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: (20 / 393) * screenWidth,
              ),
              Text(
                "Enjoy a delicious",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                " ",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "2000",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                " ",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "calorie day!",
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
          const SizedBox(height: 10),
          Container(
            width: 353,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
                width: 0.4,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: 49,
                      height: 49,
                      child: CircularProgressIndicator(
                        value: 0.4,
                        strokeWidth: 8,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFFEFC8B1)),
                        backgroundColor: Color(0xFFD9D9D9),
                        semanticsValue: '40%',
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
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
                          "10%",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 8,
                            color: Colors.black.withOpacity(0.6),
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
                            AlwaysStoppedAnimation<Color>(Color(0xFFEFC8B1)),
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
                          "10%",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 8,
                            color: Colors.black.withOpacity(0.6),
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
                            AlwaysStoppedAnimation<Color>(Color(0xFFEFC8B1)),
                        backgroundColor: Color(0xFFD9D9D9),
                        semanticsValue: '40%',
                      ),
                    )
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
                          "10%",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 8,
                            color: Colors.black.withOpacity(0.6),
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
                            AlwaysStoppedAnimation<Color>(Color(0xFFEFC8B1)),
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
                          "10%",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 8,
                            color: Colors.black.withOpacity(0.6),
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
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF)),
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
          const SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              width: 353,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    width: 353,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.4,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              const Text(
                                "Breakfast",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "0 / 1000 Kcal",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xFFF4F3F2).withOpacity(1.0),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 323,
                                child: ClipOval(
                                  child: Divider(
                                    color: Colors.black.withOpacity(0.5),
                                    thickness: 0.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 353,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.4,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              const Text(
                                "Snack 1",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "0 / 1000 Kcal",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xFFF4F3F2).withOpacity(1.0),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 323,
                                child: ClipOval(
                                  child: Divider(
                                    color: Colors.black.withOpacity(0.5),
                                    thickness: 0.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 353,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.4,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              const Text(
                                "Lunch",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "0 / 1000 Kcal",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xFFF4F3F2).withOpacity(1.0),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 323,
                                child: ClipOval(
                                  child: Divider(
                                    color: Colors.black.withOpacity(0.5),
                                    thickness: 0.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 353,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.4,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              const Text(
                                "Snack 2",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "0 / 1000 Kcal",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xFFF4F3F2).withOpacity(1.0),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 323,
                                child: ClipOval(
                                  child: Divider(
                                    color: Colors.black.withOpacity(0.5),
                                    thickness: 0.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 353,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.4,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              const Text(
                                "Dinner",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "0 / 1000 Kcal",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xFFF4F3F2).withOpacity(1.0),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 323,
                                child: ClipOval(
                                  child: Divider(
                                    color: Colors.black.withOpacity(0.5),
                                    thickness: 0.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ShoppingItemWidget(
                            itemName: "Banana",
                            itemWeight: "2 Kg",
                            onDelete: () {},
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
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

class ShoppingItemWidget extends StatelessWidget {
  final String itemName;
  final String itemWeight;
  final VoidCallback onDelete;

  const ShoppingItemWidget({
    Key? key,
    required this.itemName,
    required this.itemWeight,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 323,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(13.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 0.4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
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
                height: (10 / 852) * screenHeight,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 10,
                  color: Colors.black.withOpacity(1.0),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                itemWeight,
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
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF4F3F2).withOpacity(1.0),
            ),
            child: Center(
              child: GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.add,
                  size: 6,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
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
        onDialogDismissed();
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
                          onDialogDismissed();
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

class AlertFullScreenDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  AlertFullScreenDialog({required this.onDialogDismissed});

  @override
  _AlertFullScreenDialogState createState() => _AlertFullScreenDialogState();
}

class _AlertFullScreenDialogState extends State<AlertFullScreenDialog> {
  bool isSwitched = false;
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // const SizedBox(width: 20),
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
                              scale: 0.7,
                              // Adjust the scale factor as needed to decrease the size
                              child: CupertinoSwitch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                                activeColor:
                                    const Color(0xFFF4F3F2).withOpacity(1.0),
                                trackColor:
                                    CupertinoColors.systemGrey.withOpacity(0.8),
                                thumbColor: !isSwitched
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFFEFC8B1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: isSwitched
                                ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                : const Color(0xFFF4F3F2).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            children: [
                              // const SizedBox(height: 10),
                              Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Checkbox(
                                          value: isBreakfast,
                                          activeColor: const Color(0xFFEFC8B1),
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
                                          color: Colors.black.withOpacity(0.6),
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
                                            color:
                                                Colors.black.withOpacity(0.6),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Checkbox(
                                          value: isSnack1,
                                          activeColor: const Color(0xFFEFC8B1),
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
                                          color: Colors.black.withOpacity(0.6),
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
                                            color:
                                                Colors.black.withOpacity(0.6),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Checkbox(
                                          value: isLunch,
                                          activeColor: const Color(0xFFEFC8B1),
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
                                          color: Colors.black.withOpacity(0.6),
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
                                            color:
                                                Colors.black.withOpacity(0.6),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Checkbox(
                                          value: isSnack2,
                                          activeColor: const Color(0xFFEFC8B1),
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
                                          color: Colors.black.withOpacity(0.6),
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
                                            color:
                                                Colors.black.withOpacity(0.6),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Checkbox(
                                          value: isDinner,
                                          activeColor: const Color(0xFFEFC8B1),
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
                                          color: Colors.black.withOpacity(0.6),
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
                                            color:
                                                Colors.black.withOpacity(0.6),
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
      ),
    );
  }
}
