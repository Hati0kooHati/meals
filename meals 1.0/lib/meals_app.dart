import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';

import 'package:meals_app/screens/categories_screen.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}