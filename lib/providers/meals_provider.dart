import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/models/meal.dart';

final Provider mealsProvider = Provider((ref) {
  return mealsList;
});



class MealsProviderOld extends ChangeNotifier {
  final List<Meal> favoriteMeals = [];

  final Map<Filter, bool> filterOptions = {
    Filter.isGlutenFree: false,
    Filter.isLactoseFree: false,
    Filter.isVegetarian: false,
    Filter.isVegan: false,
  };

  List<Meal> getFiltereddMeals(String id) {
    return mealsList.where((meal) {
      if (!meal.categories.contains(id)) {
        return false;
      }

      if (filterOptions[Filter.isGlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filterOptions[Filter.isLactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (filterOptions[Filter.isVegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (filterOptions[Filter.isVegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();
  }

  void changeSwithcButton(Filter filterKey,bool isActive) {
    filterOptions[filterKey] = isActive;
    notifyListeners();
  } 

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
