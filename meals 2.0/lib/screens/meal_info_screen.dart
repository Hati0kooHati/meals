import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealInfoScreen extends StatelessWidget {
  const MealInfoScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(meal.imageUrl),

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
