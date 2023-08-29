// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'am_pm.dart';
// import 'hours.dart';
// //import 'minutes.dart';

// class Wheel extends StatefulWidget {
//   const Wheel({Key? key}) : super(key: key);

//   @override
//   _WheelState createState() => _WheelState();
// }

// class _WheelState extends State<Wheel> {
//   late FixedExtentScrollController _controller;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _controller = FixedExtentScrollController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // hours wheel
//           Container(
//             width: 70,
//             child: ListWheelScrollView.useDelegate(
//               controller: _controller,
//               itemExtent: 50,
//               perspective: 0.01,
//               diameterRatio: 1.2,
//               physics: FixedExtentScrollPhysics(),
//               childDelegate: ListWheelChildBuilderDelegate(
//                 childCount: 200,
//                 builder: (context, index) {
//                   return MyHours(
//                     hours: index,
//                   );
//                 },
//               ),
//             ),
//           ),

//           SizedBox(
//             width: 5,
//           ),

//           // // minutes wheel
//           // Container(
//           //   width: 70,
//           //   child: ListWheelScrollView.useDelegate(
//           //     itemExtent: 50,
//           //     perspective: 0.01,
//           //     diameterRatio: 1.2,
//           //     physics: FixedExtentScrollPhysics(),
//           //     childDelegate: ListWheelChildBuilderDelegate(
//           //       childCount: 60,
//           //       builder: (context, index) {
//           //         return MyMinutes(
//           //           mins: index,
//           //         );
//           //       },
//           //     ),
//           //   ),
//           // ),

//           // SizedBox(
//           //   width: 15,
//           // ),

//           // am or pm
//           Container(
//             width: 70,
//             child: ListWheelScrollView.useDelegate(
//               itemExtent: 50,
//               perspective: 0.01,
//               diameterRatio: 1.2,
//               physics: FixedExtentScrollPhysics(),
//               childDelegate: ListWheelChildBuilderDelegate(
//                 childCount: 2,
//                 builder: (context, index) {
//                   if (index == 0) {
//                     return AmPm(
//                       isItAm: true,
//                     );
//                   } else {
//                     return AmPm(
//                       isItAm: false,
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
