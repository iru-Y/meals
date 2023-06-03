import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          )
        ),
        canvasColor: const Color.fromRGBO(255, 244, 229, 1)
      ),
      home: CategoryScreen(),
    );
  }
}
