import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Refeições")),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
