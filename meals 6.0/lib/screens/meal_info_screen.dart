import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:transparent_image/transparent_image.dart';

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
    final bool isFavorite = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier).changeMealsState(meal);

              final List<String> actionInfo = isFavorite
                  ? ["deleted", "from"]
                  : ["added", "to"];

              showInfoAfterStarPressed(
                context,
                "meal has been ${actionInfo[0]} ${actionInfo[1]} favorites",
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.6, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                Icons.star,
                color: isFavorite ? Colors.yellow : Colors.white,
                key: ValueKey(isFavorite),
              ),
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
              child: Hero(
                tag: meal.id,
                child: FadeInImage(
                  width: double.infinity,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
              ),
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
