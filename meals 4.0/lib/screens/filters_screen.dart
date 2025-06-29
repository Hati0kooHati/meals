import 'package:flutter/material.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/filter_widget.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
        child: Column(
          children: [
            for (MapEntry<Filter, bool> filterName
                in context.read<MealsProvider>().filterOptions.entries)
              FilterWidget(
                filterName: filterName.key.name.replaceFirstMapped("is", (match) {
                  return "";
                },),
                topPadding: 15,
                filterNameFilter: filterName.key,
              ),
          ],
        ),
      ),
    );
  }
}
