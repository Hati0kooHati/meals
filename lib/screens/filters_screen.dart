import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_widget.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
        child: Column(
          children: [
            for (MapEntry<Filter, bool> filterName
                in ref.read(filtersProvider).entries)
              FilterWidget(filter: filterName.key, topPadding: 15),
          ],
        ),
      ),
    );
  }
}
