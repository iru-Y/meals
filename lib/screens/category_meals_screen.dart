import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

import '../components/meal_item.dart';
import '../models/category_model.dart';

class CategoryMealsScreen extends StatelessWidget {
  
  const CategoryMealsScreen({super.key});
 

  @override
  Widget build(BuildContext context) {  
    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final categoryMeals = dummyMeals.where((meal) {
        return meal.categories.contains(category.id);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refeições")
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index){
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
