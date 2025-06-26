import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';

import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:provider/provider.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteMealsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Tabs(),
      ),
    );
  }
}
