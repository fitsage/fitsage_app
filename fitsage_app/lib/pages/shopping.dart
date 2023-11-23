import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> with TickerProviderStateMixin {
  String selectedOption = ''; // Move selectedOption here
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        height: 25,
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "source sans pro",
                color: Colors.black,
                fontSize: 10,
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
                        'assets/images/edit.png',
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
            height: (33 / 852) * screenHeight,
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black.withOpacity(0.6),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: const Color(0xFFEFC8B1),
                labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                indicatorPadding: EdgeInsets.symmetric(vertical: 10),
                tabs: [
                  Tab(
                    child: Text(
                      "Glossary List",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Recipes List",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: 353,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: (20 / 852) * screenHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 8,
                                          height: 8,
                                          child: Image.asset(
                                            'assets/images/share.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Share list",
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
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 11.45,
                                          height: 9,
                                          child: Image.asset(
                                            'assets/images/order.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Order items",
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
                                  color:
                                      const Color(0xFFEFC8B1).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 5.78,
                                          height: 8,
                                          child: Image.asset(
                                            'assets/images/rupee.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Est Cost : 5000",
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
                          ],
                        ),
                        SizedBox(
                          height: (30 / 852) * screenHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "9 items",
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
                        SizedBox(
                          height: (5 / 852) * screenHeight,
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(0),
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Vegetable & fruits",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                  // You can maintain a list of items and update it accordingly
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Pantry & Eggs",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                  // You can maintain a list of items and update it accordingly
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Dairy",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                  // You can maintain a list of items and update it accordingly
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: (20 / 852) * screenHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _gestureContainer('Veg & Non veg'),
                            const Spacer(),
                            _gestureContainer('Veg'),
                            const Spacer(),
                            _gestureContainer('Vegs'),
                            const Spacer(),
                            _gestureContainer('Non Veg'),
                            const Spacer(),
                            _gestureContainer('Dairy Free'),
                          ],
                        ),
                        SizedBox(
                          height: (20 / 852) * screenHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            _gestureContainer('Veg & Non veg'),
                            const Spacer(),
                            _gestureContainer('Veg'),
                            const Spacer(),
                            _gestureContainer('Non Veg'),
                            const Spacer(),
                            _gestureContainer('Dairy Free'),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(0),
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Breakfast",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                  // You can maintain a list of items and update it accordingly
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Snack",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                  // You can maintain a list of items and update it accordingly
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Breakfast",
                                style: TextStyle(
                                  fontFamily: "source sans pro",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                  // You can maintain a list of items and update it accordingly
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ShoppingItemWidget(
                                itemName: "Banana",
                                itemWeight: "2 Kg",
                                onDelete: () {
                                  // Remove the item from the list or perform other actions
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
      width: 353,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          Container(
            width: 30,
            height: 30,
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
                  fontSize: 16,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 8.07,
                height: 8,
                child: Image.asset(
                  'assets/images/like.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                width: 9.7,
                height: 6.7,
                child: Image.asset(
                  'assets/images/protein.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Health Score - 8/10 ",
                style: TextStyle(
                  fontFamily: "source sans pro",
                  fontSize: 10,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Rich in protein",
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
          const SizedBox(width: 15),
          GestureDetector(
            onTap: onDelete, // Call the onDelete callback when tapped
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF4F3F2),
              ),
              child: Center(
                child: SizedBox(
                  width: 8,
                  height: 8,
                  child: Image.asset(
                    'assets/images/delete.png',
                    fit: BoxFit.cover,
                  ),
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
