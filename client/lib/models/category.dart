import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;

  factory Category.fromMap(Map map) {
    return Category(
      id: map["id"],
      title: map["title"],
      color: Color.fromARGB(
        255,
        map["color"][0],
        map["color"][1],
        map["color"][2],
      ),
    );
  }
}
