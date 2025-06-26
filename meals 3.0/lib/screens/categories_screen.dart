import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void onSelectedCategory(BuildContext context, Category category) {
    final List<Meal> meals = mealsList
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(title: category.title, meals: meals),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
      ),
      children: [
        for (Category category in categoriesList)
          CategoryGridItem(
            category: category,
            onSelectedCategory: onSelectedCategory,
          ),
      ],
    );
  }
}
