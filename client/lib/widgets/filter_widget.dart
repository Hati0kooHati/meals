import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/providers/filters_provider.dart';

final Map<Filter, String> filterNameAsString = {
  Filter.isGlutenFree: "Gluten-free",
  Filter.isLactoseFree: "Lactose-free",
  Filter.isVegetarian: "Vegetarian",
  Filter.isVegan: "Vegan",
};

class FilterWidget extends ConsumerWidget {
  const FilterWidget({
    super.key,

    required this.topPadding,
    required this.filter,
  });

  final Filter filter;
  final double topPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: SwitchListTile(
        title: Text(
          filterNameAsString[filter]!,
          style: TextStyle(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontSize: 30,
          ),
        ),
        subtitle: Text(
          "only include ${filterNameAsString[filter]} meals",
          style: TextStyle(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontSize: 15,
          ),
        ),
        activeColor: const Color.fromARGB(210, 255, 235, 59),
        value: ref.watch(filtersProvider)[filter]!,
        onChanged: (value) {
          ref
              .read(filtersProvider.notifier)
              .changeFilterState(filter: filter, isActive: value);
        },
      ),
    );
  }
}
