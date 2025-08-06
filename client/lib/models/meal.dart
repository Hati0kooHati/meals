enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String complexity;
  final String affordability;

  factory Meal.fromMap(Map map) {
    return Meal(
      id: map["id"],
      title: map["title"],
      imageUrl: map["imageUrl"],
      ingredients: List<String>.from(map["ingredients"] as List),
      steps: List<String>.from(map["steps"] as List),
      duration: map["duration"],
      complexity: map["complexity"],
      affordability: map["affordability"],
    );
  }
}
