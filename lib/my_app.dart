import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tab_screen.dart';
import 'package:meals/untils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
          titleLarge: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          )
        ),
        canvasColor: const Color.fromRGBO(255, 244, 229, 1)
      ),
      routes: {
        AppRoutes.home : (context) => const TabScreen(),
        AppRoutes.categoryMeals : (context) => const CategoryMealsScreen(),
        AppRoutes.mealDetailScreen :(context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => const Settings()
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context)=> const CategoriesScreen()));
  }
}
