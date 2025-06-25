import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_widget.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(context) {
    Widget body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ooh... nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Try selecting a different category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealWidget(meal: meals[index],);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
    );
  }
}
