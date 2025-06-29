import 'package:flutter/material.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.filterName,
    required this.topPadding,
    required this.filterNameFilter,
  });

  final String filterName;
  final Filter filterNameFilter;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: SwitchListTile(
        title: Text(
          filterName,
          style: TextStyle(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontSize: 30,
          ),
        ),
        subtitle: Text(
          "only include $filterName meals",
          style: TextStyle(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontSize: 15,
          ),
        ),
        activeColor: const Color.fromARGB(210, 255, 235, 59),
        value: context.watch<MealsProvider>().filterOptions[filterNameFilter]!,
        onChanged: (value) {
          context.read<MealsProvider>().changeSwithcButton(
            filterNameFilter,
            value,
          );
        },
      ),
    );
  }
}
