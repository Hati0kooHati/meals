import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meal_widget.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  Widget build(context, WidgetRef ref) {
    return ref
        .watch(mealsProvider(id))
        .when(
          data: (mealsList) {
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

            if (mealsList.isNotEmpty) {
              body = ListView.builder(
                itemCount: mealsList.length,
                itemBuilder: (_, index) => MealWidget(meal: mealsList[index]),
              );
            }

            return Scaffold(
              appBar: AppBar(title: Text(title)),
              body: body,
            );
          },
          error: (e, stack) => Center(child: Text("$e $stack")),
          loading: () => Center(child: CircularProgressIndicator()),
        );
  }
}
