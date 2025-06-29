import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meal_widget.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, this.id});

  final String? title;
  final String? id;

  @override
  Widget build(context) {
    Widget body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ooh... nothing here!",
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            "Try selecting a different category!",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );

    // it's called to display favorite meals
    if (title == null &&
        context.read<MealsProvider>().favoriteMeals.isNotEmpty) {
      List<Meal> favoriteMeals = context.watch<MealsProvider>().favoriteMeals;
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealWidget(meal: favoriteMeals[index]);
        },
      );
    }

    if (title != null &&
        context.read<MealsProvider>().getFiltereddMeals(id!).isNotEmpty) {
      final List<Meal> meals = context.read<MealsProvider>().getFiltereddMeals(
        id!,
      );
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealWidget(meal: meals[index]);
        },
      );
    }

    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: body,
    );
  }
}
