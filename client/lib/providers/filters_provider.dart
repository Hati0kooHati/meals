import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/models/meal.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.isGlutenFree: false,
        Filter.isLactoseFree: false,
        Filter.isVegetarian: false,
        Filter.isVegan: false,
      });

  void changeFilterState({required Filter filter, required bool isActive}) {
    state = {...state, filter: isActive};
  }

  List<Meal> getFilteredMeals({required String id}) {
    return mealsList.where((meal) {
      if (!meal.categories.contains(id)) {
        return false;
      }

      if (state[Filter.isGlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (state[Filter.isLactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (state[Filter.isVegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (state[Filter.isVegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();
  }
}

final StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>
filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((
  ref,
) {
  return FiltersNotifier();
});
