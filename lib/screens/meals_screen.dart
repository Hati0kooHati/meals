import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/meal_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({super.key, this.title, this.id});

  final String? title;
  final String? id;

  @override
  Widget build(context, WidgetRef ref) {
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
    if (title == null && ref.read(favoriteMealsProvider).isNotEmpty) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealWidget(meal: favoriteMeals[index]);
        },
      );
    }

    if (title != null &&
        ref
            .read(filtersProvider.notifier)
            .getFilteredMeals(id: id!)
            .isNotEmpty) {
      final List<Meal> meals = ref
          .read(filtersProvider.notifier)
          .getFilteredMeals(id: id!);
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
