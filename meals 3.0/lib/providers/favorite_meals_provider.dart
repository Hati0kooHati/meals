import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsProvider extends ChangeNotifier {
  final List<Meal> favoriteMeals = [];

  void onFavoriteButtonTapped({required final Meal meal}) {
    if (favoriteMeals.contains(meal)) {
      favoriteMeals.remove(meal);
    } else {
      favoriteMeals.add(meal);
    }
    notifyListeners();
  }

  bool isContainsMeal(Meal meal) {
    return favoriteMeals.contains(meal);
  }

}
