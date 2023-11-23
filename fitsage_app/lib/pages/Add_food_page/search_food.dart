import 'package:fitsage_app/pages/Add_food_page/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitsage_app/pages/Add_food_page/meal_plan_list.dart';

class SearchFoodPage extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  SearchFoodPage({
    required this.onDialogDismissed,
  });

  @override
  _SearchFoodPageState createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;
  bool showScanMeal = false;
  bool searchTapped = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {
      showScanMeal = _searchController.text.length > 1;
      performSearch(_searchController.text); // Call performSearch here
    });
  }

  List<String> data = [
    "Apple",
    "Dosa",
    "Masala Dosa",
    "Dosa with Egg",
    "Dosa with ghee",
    "Banana",
    "Roti",
    "Dal",
    "Curry",
    "Biryani",
    "Samosa",
    "Chaat",
    "Idli",
    "Rasgulla",
    "Pulao",
    "Jalebi"
  ];
  List<String> searchResults = [];

  void performSearch(String query) {
    searchResults.clear();
    if (query.isEmpty) {
      setState(() {
        searchResults.addAll(data);
      });
    } else {
      data.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          setState(() {
            searchResults.add(item);
          });
        }
      });
    }
  }

  List<Map<String, String>> mealData = [
    {"mealName": "Apple", "quantity": "4", "type": "kgs", "cal": "200"},
    {"mealName": "Dosa", "quantity": "1", "type": "Medium", "cal": "200"},
    {"mealName": "Banana", "quantity": "3", "type": "Pieces", "cal": "200"},
    {"mealName": "Apple", "quantity": "4", "type": "kgs", "cal": "200"},
  ];

  List<Map<String, String>> frequentlyMeal = [
    {"mealName": "Apple", "quantity": "4", "type": "kgs", "cal": "200"},
    {"mealName": "Dosa", "quantity": "1", "type": "Medium", "cal": "200"},
    {"mealName": "Banana", "quantity": "3", "type": "Pieces", "cal": "200"},
    {"mealName": "Apple", "quantity": "4", "type": "kgs", "cal": "200"},
    {"mealName": "Apple", "quantity": "4", "type": "kgs", "cal": "200"},
    {"mealName": "Dosa", "quantity": "1", "type": "Medium", "cal": "200"},
    {"mealName": "Banana", "quantity": "3", "type": "Pieces", "cal": "200"},
  ];

  List<Map<String, String>> selectedMealDetails = [];

  void addToSelectedMeals(Map<String, String> mealDetails) {
    setState(() {
      selectedMealDetails.add(mealDetails);
      _searchController.clear();
    });
  }

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void navigateToNextPage(int index) {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) => RecipeDialog(
          searchText: searchResults[index],
          sendDetails: addToSelectedMeals, // Pass the function to send details
          onDialogDismissed: toggleExpand,
        ),
      );
      toggleExpand();
    }
  }

  // void navigateToNextPage(int index) {
  //   if (!isExpanded) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => RecipeDialog(
  //           searchText: searchResults[index],
  //           onDialogDismissed: toggleExpand,
  //         ),
  //       ),
  //     );
  //     toggleExpand();
  //   }
  // }

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
                        widget.onDialogDismissed();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/Arrow.svg",
                        width: 16,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Add Food",
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(width: (20 / 393) * screenWidth),
                  ],
                ),
                SizedBox(height: (20 / 852) * screenHeight),
                SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SizedBox(
                      width: (353 / 393) * screenWidth,
                      child: SearchBar(
                        hintText: "Search for the food ",
                        hintStyle: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            return TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            );
                          },
                        ),
                        textStyle: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            return const TextStyle(
                              color: Colors.black,
                              fontFamily: "source sans pro",
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            );
                          },
                        ),
                        elevation: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            return 0.0;
                          },
                        ),
                        side: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            return const BorderSide(
                              color: Colors.black,
                              width: 0.5,
                            );
                          },
                        ),
                        controller: _searchController,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                        ),
                        onTap: () {
                          setState(() {
                            searchTapped = !searchTapped;
                          });
                        },
                        trailing: [
                          !_searchController.text.isNotEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: SvgPicture.asset(
                                    "assets/icons/Search.svg",
                                    height: 18,
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _searchController.clear();
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/cross.svg",
                                      height: 16,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return <Widget>[];
                  },
                ),
                SizedBox(height: (20 / 852) * screenHeight),
                Visibility(
                  visible: _searchController.text.length <= 1,
                  child: Expanded(
                    child: SizedBox(
                      width: (353 / 393) * screenWidth,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: (166.5 / 393) * screenWidth,
                                        height: (100 / 852) * screenHeight,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEFC8B1)
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/scanmeal.svg",
                                                height: 25,
                                              ),
                                              SizedBox(
                                                height:
                                                    (5 / 852) * screenHeight,
                                              ),
                                              Text(
                                                "Scan a Meal",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 14,
                                                  color: Colors.black
                                                      .withOpacity(1.0),
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: (20 / 393) * screenWidth),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: (166.5 / 393) * screenWidth,
                                        height: (100 / 852) * screenHeight,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F3F2)
                                              .withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/Scan.svg",
                                                height: 25,
                                              ),
                                              SizedBox(
                                                height:
                                                    (5 / 852) * screenHeight,
                                              ),
                                              Text(
                                                "Scan Barcode",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 14,
                                                  color: Colors.black
                                                      .withOpacity(1.0),
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: TabBar(
                                            controller: _tabController,
                                            labelColor: Colors.black,
                                            isScrollable: true,
                                            indicatorSize:
                                                TabBarIndicatorSize.label,
                                            indicatorColor:
                                                const Color(0xFFEFC8B1),
                                            labelPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            indicatorPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10),
                                            tabs: const [
                                              Tab(
                                                child: Text(
                                                  "All Foods",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  "Saved Meals",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily:
                                                        "source sans pro",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  "Own Recipes",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily:
                                                          "source sans pro",
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 353,
                                        height: screenHeight * 0.6,
                                        child: TabBarView(
                                          controller: _tabController,
                                          children: [
                                            SizedBox(
                                              width: 353,
                                              child: NotificationListener<
                                                  ScrollEndNotification>(
                                                onNotification: (notification) {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  return true;
                                                },
                                                child: ListView(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  children: [
                                                    SizedBox(
                                                        height: (5 / 852) *
                                                            screenHeight),
                                                    const Text(
                                                      "Frequently Tracked food",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: (15 / 852) *
                                                            screenHeight),
                                                    ...frequentlyMeal
                                                        .map((meal) {
                                                      return MealplanList(
                                                        mealName:
                                                            meal["mealName"]!,
                                                        calIntake:
                                                            meal["quantity"]!,
                                                        type: meal["type"]!,
                                                        calTarget: meal["cal"]!,
                                                        selected:
                                                            selectedMealDetails
                                                                .contains(meal),
                                                        onNext: () {
                                                          addToSelectedMeals(
                                                              meal);
                                                        },
                                                      );
                                                    }).toList(),
                                                    SizedBox(
                                                        height: (5 / 852) *
                                                            screenHeight),
                                                    const Text(
                                                      "Meal Plan",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "source sans pro",
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: (15 / 852) *
                                                            screenHeight),
                                                    ...mealData.map((meal) {
                                                      return MealplanList(
                                                        mealName:
                                                            meal["mealName"]!,
                                                        calIntake:
                                                            meal["quantity"]!,
                                                        type: meal["type"]!,
                                                        calTarget: meal["cal"]!,
                                                        selected:
                                                            selectedMealDetails
                                                                .contains(meal),
                                                        onNext: () {
                                                          addToSelectedMeals(
                                                              meal);
                                                        },
                                                      );
                                                    }).toList(),
                                                    SizedBox(
                                                        height: (20 / 852) *
                                                            screenHeight),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 353,
                                              child: ListView(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                children: [
                                                  SizedBox(
                                                      height: (10 / 852) *
                                                          screenHeight),
                                                  const Text(
                                                    "Meal Plan",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "source sans pro",
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 353,
                                              child: ListView(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                children: [
                                                  SizedBox(
                                                      height: (10 / 852) *
                                                          screenHeight),
                                                  const Text(
                                                    "Meal Plan",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "source sans pro",
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: showScanMeal,
                  child: Expanded(
                    child: Container(
                      width: (353 / 393) * screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          searchResults.isEmpty
                              ? const Text(
                                  "No Result Found",
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                )
                              : const Text(
                                  "Search Recipe results",
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                          SizedBox(height: (10 / 852) * screenHeight),
                          Expanded(
                            child: ListView.builder(
                              itemCount: searchResults.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => navigateToNextPage(index),
                                      child: Container(
                                        height: (25 / 852) * screenHeight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(searchResults[index]),
                                            SvgPicture.asset(
                                              "assets/icons/add.svg",
                                              height: 16.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: (10 / 852) * screenHeight),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (selectedMealDetails.isNotEmpty &&
                    _searchController.text.length <= 1)
                  Positioned(
                    child: GestureDetector(
                      onTap: selectedMealDetails.length > 1
                          ? () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: ListView(
                                      key: UniqueKey(),
                                      padding: const EdgeInsets.all(0),
                                      reverse: true,
                                      children: [
                                        SizedBox(
                                            height: (5 / 852) * screenHeight),
                                        GestureDetector(
                                          onTap: (() {}),
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                ...selectedMealDetails
                                                    .map((meal) {
                                                  return SizedBox(
                                                    key: UniqueKey(),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: (353 / 393) *
                                                              screenWidth,
                                                          height: (50 / 852) *
                                                              screenHeight,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  width: (10 /
                                                                          393) *
                                                                      screenWidth),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "${meal["mealName"]!}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "source sans pro",
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              1.0),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height: (3 /
                                                                              852) *
                                                                          screenHeight),
                                                                  Text(
                                                                    "${meal["quantity"]!} ${meal["type"]!}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "source sans pro",
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.6),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                "${meal["cal"]!} cal",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "source sans pro",
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.6),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: (8 /
                                                                          393) *
                                                                      screenWidth),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedMealDetails
                                                                        .remove(
                                                                            meal);
                                                                  });
                                                                },
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  "assets/icons/cross.svg",
                                                                  height: 13,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: (10 /
                                                                          393) *
                                                                      screenWidth),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: (10 / 852) *
                                                                screenHeight),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: (5 / 852) * screenHeight),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width:
                                                    (20 / 393) * screenWidth),
                                            const Text(
                                              "All Added Foods",
                                              style: TextStyle(
                                                fontFamily: "source sans pro",
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                if (selectedMealDetails
                                                    .isNotEmpty) {
                                                  setState(() {
                                                    selectedMealDetails.clear();
                                                  });
                                                  Navigator.of(context).pop();
                                                  widget.onDialogDismissed();
                                                }
                                              },
                                              child: const Text(
                                                "Clear all",
                                                style: TextStyle(
                                                  fontFamily: "source sans pro",
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    (20 / 393) * screenWidth),
                                          ],
                                        ),
                                        SizedBox(
                                            height: (20 / 852) * screenHeight),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          : (() {}),
                      child: Container(
                        width: screenWidth,
                        height: (50 / 852) * screenHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFC8B1).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: (20 / 393) * screenWidth),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // Center vertically
                              children: [
                                Text(
                                  "${selectedMealDetails.last["mealName"]!}",
                                  style: TextStyle(
                                    fontFamily: "source sans pro",
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(1.0),
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: (3 / 852) * screenHeight,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${selectedMealDetails.last["quantity"]!} ${selectedMealDetails.last["type"]!}",
                                      style: TextStyle(
                                        fontFamily: "source sans pro",
                                        fontSize: 10,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    if (selectedMealDetails.length > 1)
                                      Text(
                                        " | ",
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    if (selectedMealDetails.length > 1)
                                      Text(
                                        "View ${selectedMealDetails.length - 1} more Items",
                                        style: const TextStyle(
                                          fontFamily: "source sans pro",
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "${selectedMealDetails.last["cal"]!} cal",
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 10,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(width: (8 / 393) * screenWidth),
                            GestureDetector(
                                onTap: () {
                                  if (selectedMealDetails.isNotEmpty) {
                                    setState(() {
                                      selectedMealDetails.removeLast();
                                    });
                                  }
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/cross.svg",
                                  height: 13,
                                )),
                            SizedBox(width: (20 / 393) * screenWidth),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
