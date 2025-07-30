import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  void onOptionPressed(BuildContext context, String title) {
    if (title == "filters") {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FiltersScreen()),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 113, 37, 9),
                  const Color.fromARGB(192, 128, 42, 11),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                  color: Color.fromARGB(255, 221, 147, 120),
                ),
                const SizedBox(width: 18),
                Text(
                  "Cooking up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 216, 147, 122),
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.restaurant, size: 30),
            title: Text("meals", style: TextStyle(fontSize: 25)),
            onTap: () {
              onOptionPressed(context, "meals");
            },
          ),

          ListTile(
            leading: Icon(Icons.settings, size: 30),
            title: Text("filters", style: TextStyle(fontSize: 25)),
            onTap: () {
              onOptionPressed(context, "filters");
            },
          ),
        ],
      ),
    );
  }
}
