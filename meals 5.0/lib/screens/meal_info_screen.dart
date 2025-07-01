import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';

class MealInfoScreen extends ConsumerWidget {
  const MealInfoScreen({super.key, required this.meal});

  final Meal meal;

  void showInfoAfterStarPressed(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(context, WidgetRef ref) {
    final bool isContainsMeal = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier).changeMealsState(meal);

              final List<String> actionInfo = isContainsMeal
                  ? ["deleted", "from"]
                  : ["added", "to"];

              showInfoAfterStarPressed(
                context,
                "meal has been ${actionInfo[0]} ${actionInfo[1]} favorites",
              );
            },
            icon: Icon(
              Icons.star,
              color: isContainsMeal ? Colors.yellow : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.network(meal.imageUrl),
            ),
            const SizedBox(height: 15),
            Text(
              "Ingredients",
              style: TextStyle(color: Colors.amber[900], fontSize: 30),
            ),
            for (final String ingredient in meal.ingredients)
              Text(ingredient, style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Text(
              "Steps",
              style: TextStyle(color: Colors.amber[900], fontSize: 30),
            ),
            for (final String step in meal.steps)
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  step,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
