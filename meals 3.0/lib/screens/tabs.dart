import 'package:flutter/material.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:provider/provider.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late int screenIndex;
  late String title;
  // screens;

  void onBottomNavBartap(index) {
    setState(() {
      screenIndex = index;

      screenIndex == 0 ? title = "Categories" : title = "Favorities";
    });
  }

  late final List<Widget> screens = [
    CategoriesScreen(),
    MealsScreen(
      title: null,
      meals: context.read<FavoriteMealsProvider>().favoriteMeals,
    ),
  ];

  @override
  void initState() {
    super.initState();
    screenIndex = 0;
    title = "Categories";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 23),
        ),
      ),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        onTap: onBottomNavBartap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      ),
    );
  }
}
