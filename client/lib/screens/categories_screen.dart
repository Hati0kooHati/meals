import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/categories_provider.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_widget.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  void onSelectedCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: category.title, id: category.id),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(context) {
    return ref
        .watch(categoriesProvider)
        .when(
          data: (categoriesList) => Scaffold(
            body: AnimatedBuilder(
              animation: _animationController,
              child: GridView(
                padding: EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                ),
                children: [
                  for (Category category in categoriesList)
                    CategoryGridItem(
                      category: category,
                      onSelectedCategory: onSelectedCategory,
                    ),
                ],
              ),
              builder: (context, child) {
                return SlideTransition(
                  position:
                      Tween(
                        begin: const Offset(0, 1),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.elasticOut,
                        ),
                      ),

                  child: child,
                );
              },
            ),
          ),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, stack) => Center(child: Text("Unexpected error occured")),
        );
  }
}
