import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/widgets/meal_widget.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

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

    if (meals.isNotEmpty) {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealWidget(meal: meals[index]);
        },
      );
    }

    if (title == null) {
      body = Consumer<FavoriteMealsProvider>(
        builder: (context, favoriteMealsProvider, child) {
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealWidget(
                meal: favoriteMealsProvider.favoriteMeals[index],
              );
            },
          );
        },
      );
      return body;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: body,
    );
  }
}
