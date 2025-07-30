import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
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
    return AnimatedBuilder(
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
        // return Padding(
        //   padding: EdgeInsetsGeometry.only(
        //     top: 100 - _animationController.value,
        //     bottom: 100 - _animationController.value,
        //     right: 100 - _animationController.value,
        //     left: 100 - _animationController.value,
        //   ),
        //   child: child,
        // );
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.elasticOut,
                ),
              ),

          child: child,
        );
      },
    );
  }
}
