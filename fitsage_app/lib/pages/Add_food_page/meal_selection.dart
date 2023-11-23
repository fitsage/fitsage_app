import 'package:fitsage_app/pages/Add_food_page/custom_meal_list.dart';
import 'package:fitsage_app/pages/Add_food_page/search_food.dart';
import 'package:flutter/material.dart';

class MealSelectiondialog extends StatefulWidget {
  const MealSelectiondialog({Key? key}) : super(key: key);

  @override
  _MealSelectiondialogState createState() => _MealSelectiondialogState();
}

class _MealSelectiondialogState extends State<MealSelectiondialog> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void TrackingDialog() {
    if (!isExpanded) {
      showDialog(
        context: context,
        builder: (context) {
          return SearchFoodPage(
            onDialogDismissed: toggleExpand,
          );
        },
      );
      toggleExpand();
    }
  }

  @override
  Widget build(BuildContext context) {
    double breakfastTarget = 1000;
    double breakfastCalIntake = 400;
    double snack1Target = 1000;
    double snack1CalIntake = 1000;
    double snack2Target = 1000;
    double snack2CalIntake = 400;
    double lunchTarget = 1000;
    double lunchCalIntake = 400;
    double dinnerTarget = 1000;
    double dinnerCalIntake = 400;

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomMealList(
                mealName: "Breakfast",
                calIntake: breakfastCalIntake,
                calTarget: breakfastTarget,
                onNext: TrackingDialog),
            CustomMealList(
                mealName: "Snack 1",
                calIntake: snack1CalIntake,
                calTarget: snack1Target,
                onNext: TrackingDialog),
            CustomMealList(
                mealName: "lunch",
                calIntake: lunchCalIntake,
                calTarget: lunchTarget,
                onNext: TrackingDialog),
            CustomMealList(
                mealName: "Snack 2",
                calIntake: snack2CalIntake,
                calTarget: snack2Target,
                onNext: TrackingDialog),
            CustomMealList(
                mealName: "Dinner",
                calIntake: dinnerCalIntake,
                calTarget: dinnerTarget,
                onNext: TrackingDialog),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
