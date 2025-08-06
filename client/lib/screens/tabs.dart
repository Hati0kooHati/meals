import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  late int screenIndex;
  late String title;
  late final List<Widget> screens;
  // screens;

  void onBottomNavBarTap(index) {
    setState(() {
      screenIndex = index;

      screenIndex == 0 ? title = "Categories" : title = "Favorities";
    });
  }

  @override
  void initState() {
    super.initState();
    screenIndex = 0;
    title = "Categories";

    screens = [CategoriesScreen(), MealsScreen(title: null)];
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
      drawer: FilterDrawer(),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        onTap: onBottomNavBarTap,
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
