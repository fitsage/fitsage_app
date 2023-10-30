import 'package:fitsage_app/custom_widgets/Event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter/material.dart';

class Timetile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String child1;
  final String child2;

  const Timetile({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.child1,
    required this.child2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            thickness: 2,
            color: isPast ? const Color(0xFFEFC8B1) : const Color(0xFFF4F3F2)),
        indicatorStyle: IndicatorStyle(
            width: 15,
            color: isPast ? const Color(0xFFEFC8B1) : const Color(0xFFF4F3F2)),
        endChild: EventCard(
          isPast: isPast,
          child1: child1,
          child2: child2,
        ),
      ),
    );
  }
}
