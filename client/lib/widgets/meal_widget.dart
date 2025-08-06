import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_info_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MealInfoScreen(meal: meal)),
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.fitWidth,

                height: 200,
                width: double.infinity,
              ),
            ),

            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: 75,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time_rounded),
                            const SizedBox(width: 5),
                            Text(
                              "${meal.duration} min",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(
                              meal.complexity,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            Text(
                              meal.affordability,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
