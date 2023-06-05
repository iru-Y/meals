import 'package:flutter/material.dart';
import 'package:meals/models/category_model.dart';

import '../untils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {

    void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoryMeals,
      arguments: category,
    );
  }

    return InkWell(
       borderRadius: (BorderRadius.circular(10)),
       splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCategory(context),
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: (BorderRadius.circular(10)),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: Text(
            category.title
          ),
        ),
      ),
    );
  }
}