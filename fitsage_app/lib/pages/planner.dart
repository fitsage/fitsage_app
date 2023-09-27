import 'package:flutter/material.dart';

class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: (66 / 852) * screenHeight,
          ),
          Stack(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "For a",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    "7",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    "days",
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
              Positioned(
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset(
                        'assets/images/setting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 16.88,
                      height: 15,
                      child: Image.asset(
                        'assets/images/alert.png',
                        fit: BoxFit.cover,
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
              SizedBox(
                width: 16,
                height: 8,
                child: Image.asset(
                  'assets/images/down.png',
                  fit: BoxFit.cover,
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
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                " ",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "2000",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                " ",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "calorie day!",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 18,
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
          const SizedBox(height: 30),
          Expanded(
            child: SizedBox(
              width: 353,
              child: ListView(
                scrollDirection: Axis.vertical,
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
