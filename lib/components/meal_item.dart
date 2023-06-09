import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/untils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.pushNamed(context, arguments: meal, AppRoutes.mealDetailScreen);
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
              ),
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(meal.complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(meal.costText)
                    ],
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
