import 'package:flutter/material.dart';

class PersonalDialog extends StatefulWidget {
  final VoidCallback onDialogDismissed;

  PersonalDialog({required this.onDialogDismissed});

  @override
  _PersonalDialogState createState() => _PersonalDialogState();
}

class _PersonalDialogState extends State<PersonalDialog> {
  String selectedGender = 'male';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    TextEditingController NameController = TextEditingController();
    NameController.text = 'Yallapu V Madhuri';

    TextEditingController phoneNumberController = TextEditingController();
    phoneNumberController.text = '123-456-7890';

    TextEditingController EmailController = TextEditingController();
    EmailController.text = 'abc@gmail.com';

    TextEditingController ageController = TextEditingController();
    ageController.text = '25';

    TextEditingController weightKgController = TextEditingController();
    weightKgController.text = '65';
    TextEditingController weightGramsController = TextEditingController();
    weightGramsController.text = '0';
    String weightUnit = 'Kg';

    String dropdownvalue = 'Kg';
    var items = [
      'Kg',
      'Lb',
    ];

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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(height: 10),
                        Text(
                          "Name",
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
                          controller: NameController,
                          cursorColor: const Color(0xFFF4F3F2),
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Color(0xFFF4F3F2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: 'Enter your Name',
                            labelStyle: TextStyle(fontSize: 18),
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Phone Number",
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
                          controller: phoneNumberController,
                          cursorColor: const Color(0xFFF4F3F2),
                          keyboardType: TextInputType
                              .phone, // Specify input type for phone number
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF4F3F2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: 'Enter your phone number',
                            labelStyle: TextStyle(fontSize: 18),
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixText: '+91',
                            prefixStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Email",
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
                          controller: EmailController,
                          cursorColor: const Color(0xFFF4F3F2),
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF4F3F2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: '25',
                            labelStyle: TextStyle(fontSize: 18),
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'male';
                                });
                              },
                              child: Container(
                                width: (110 / 393) * screenWidth,
                                height: (58 / 852) * screenHeight,
                                decoration: BoxDecoration(
                                  color: selectedGender == 'male'
                                      ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                      : const Color(0xFFF4F3F2)
                                          .withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/male.png",
                                        width: screenWidth * (30 / 393),
                                        height: screenHeight * (25.36 / 852),
                                      ),
                                      SizedBox(width: (4 / 393) * screenWidth),
                                      Text(
                                        'Male',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          color: const Color(0xFF514644)
                                              .withOpacity(1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'female';
                                });
                              },
                              child: Container(
                                width: (110 / 393) * screenWidth,
                                height: (58 / 852) * screenHeight,
                                decoration: BoxDecoration(
                                  color: selectedGender == 'female'
                                      ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                      : const Color(0xFFF4F3F2)
                                          .withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/female.png",
                                        width: screenWidth * (30 / 393),
                                        height: screenHeight * (25.36 / 852),
                                      ),
                                      SizedBox(width: (4 / 393) * screenWidth),
                                      Text(
                                        'Female',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "source sans pro",
                                          color: const Color(0xFF514644)
                                              .withOpacity(1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = 'other';
                                });
                              },
                              child: Container(
                                width: (110 / 393) * screenWidth,
                                height: (58 / 852) * screenHeight,
                                decoration: BoxDecoration(
                                  color: selectedGender == 'other'
                                      ? const Color(0xFFEFC8B1).withOpacity(0.1)
                                      : const Color(0xFFF4F3F2)
                                          .withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Others',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "source sans pro",
                                      color: const Color(0xFF514644)
                                          .withOpacity(1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Age",
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
                          controller: ageController,
                          cursorColor: const Color(0xFFF4F3F2),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF4F3F2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFEFC8B1),
                              ),
                            ),
                            labelText: 'Enter your age',
                            labelStyle: TextStyle(fontSize: 18),
                            contentPadding: EdgeInsets.all(15),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              width: 130,
                              child: TextField(
                                controller: weightKgController,
                                cursorColor: const Color(0xFFF4F3F2),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF4F3F2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEFC8B1),
                                    ),
                                  ),
                                  labelText: '65',
                                  labelStyle: TextStyle(fontSize: 18),
                                  contentPadding: EdgeInsets.all(15),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  suffixText: 'Kgs',
                                  suffixStyle: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 130,
                              child: TextField(
                                controller: weightGramsController,
                                cursorColor: const Color(0xFFF4F3F2),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF4F3F2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEFC8B1),
                                    ),
                                  ),
                                  labelText: '0',
                                  labelStyle: TextStyle(fontSize: 18),
                                  contentPadding: EdgeInsets.all(15),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  suffixText: dropdownvalue == 'Kg' ? 'g' : '',
                                  suffixStyle: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 73,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFF4F3F2),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: DropdownButton(
                                  value: dropdownvalue,
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  style: const TextStyle(
                                    fontFamily: "source sans pro",
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                  underline: Container(),
                                  isExpanded: true,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFF4F3F2),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: DropdownButton(
                              value: dropdownvalue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                              icon: Icon(Icons.keyboard_arrow_down),
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                              underline: Container(),
                              isExpanded: true,
                            ),
                          ),
                        )
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
