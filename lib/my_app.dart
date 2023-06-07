import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings_model.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tab_screen.dart';
import 'package:meals/untils/app_routes.dart';

import 'models/meal_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 SettingsModel settingsModel = SettingsModel();

 List<Meal> availableMeal = dummyMeals;

    void _filterMeals(SettingsModel settingsModel) {
      setState(() {
        this.settingsModel = settingsModel;

        availableMeal = dummyMeals.where((meal) {
          final filterGluten = settingsModel.isGlutenFree && !meal.isGlutenFree;
          final filterLactose =
              settingsModel.isLactoseFree && !meal.isLactoseFree;
          final filterVegetarian =
              settingsModel.isVegetarian && !meal.isVegetarian;
          final filterVegan = settingsModel.isVegan && !meal.isVegan;
          return !filterGluten &&
              !filterLactose &&
              !filterVegetarian &&
              !filterVegan;
        }).toList();
      });
    }

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.pink,
            primaryColor: Colors.amber,
            iconTheme: const IconThemeData(color: Colors.white),
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
                )),
            canvasColor: const Color.fromRGBO(255, 244, 229, 1)),
        routes: {
          AppRoutes.home: (context) => const TabScreen(),
          AppRoutes.categoryMeals: (context) =>
              CategoryMealsScreen(meals: availableMeal),
          AppRoutes.mealDetailScreen: (context) => const MealDetailScreen(),
          AppRoutes.settings: (context) => SettingsScreen(
              onSettingsChanged: _filterMeals, settingsModel: settingsModel)
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => const CategoriesScreen()));
  }
}
