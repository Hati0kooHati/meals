import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:provider/provider.dart';

class MealInfoScreen extends StatefulWidget {
  const MealInfoScreen({super.key, required this.meal});

  final Meal meal;

  @override
  State<MealInfoScreen> createState() => _MealInfoScreenState();
}

class _MealInfoScreenState extends State<MealInfoScreen> {
  void showInfoAfterStarPressed(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                context.read<MealsProvider>().onFavoriteButtonTapped(
                  meal: widget.meal,
                );

                final List<String> actionInfo =
                    context
                        .read<MealsProvider>()
                        .favoriteMeals
                        .contains(widget.meal)
                    ? ["added", "to"]
                    : ["deleted", "from"];

                showInfoAfterStarPressed(
                  context,
                  "meal has been ${actionInfo[0]} ${actionInfo[1]} favorites",
                );
              });
            },
            icon: Icon(
              Icons.star,
              color:
                  context.read<MealsProvider>().isContainsMeal(
                    widget.meal,
                  )
                  ? Colors.yellow
                  : Colors.white,
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
              child: Image.network(widget.meal.imageUrl),
            ),

            const SizedBox(height: 15),

            Text(
              "Ingredients",
              style: TextStyle(color: Colors.amber[900], fontSize: 30),
            ),
            for (final String ingredient in widget.meal.ingredients)
              Text(ingredient, style: TextStyle(color: Colors.white)),

            const SizedBox(height: 20),

            Text(
              "Steps",
              style: TextStyle(color: Colors.amber[900], fontSize: 30),
            ),

            for (final String step in widget.meal.steps)
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
