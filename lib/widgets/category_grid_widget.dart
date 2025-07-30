import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectedCategory,
  });

  final Category category;
  final void Function(BuildContext context, Category category)
  onSelectedCategory;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        onSelectedCategory(context, category);
      },
      splashColor: Colors.orange,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withAlpha(140),
              category.color.withAlpha(230),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
