import 'package:flutter/material.dart';

class TrackingAddDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;
  // int currentIndex;

  TrackingAddDialog({
    required this.onDialogDismissed,
    // required this.currentIndex,
  });

  @override
  _TrackingAddDialogState createState() => _TrackingAddDialogState();
}

class _TrackingAddDialogState extends State<TrackingAddDialog> {
  TextEditingController searchController = TextEditingController();
  List<String> data = [
    "Steps",
    "Sugar",
    "Caffeine",
    "Water",
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
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF514644)),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Add Tracker',
                                suffixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                              onChanged: (query) {
                                performSearch(query);
                              },
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(searchResults[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // CustomBottomNavigationBar(
                //   currentIndex: widget.currentIndex,
                //   onTap: (int index) {
                //     // Update the currentIndex when a tab is tapped
                //     setState(() {
                //       widget.currentIndex = index;
                //     });
                //     if (index == 0) {
                //       const MainPage();
                //     } else if (index == 1) {
                //       const Planner();
                //     } else if (index == 2) {
                //       Tracking(selectedOption: 'Calories');
                //     } else if (index == 3) {
                //       const Shopping();
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
