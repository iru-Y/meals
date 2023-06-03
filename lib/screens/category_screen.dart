import 'package:flutter/material.dart';
import 'package:meals/component/category_item.dart';
import 'package:meals/data/dummy_data.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?',
          style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          children: dummyCategories.map((e) => CategoryItem(category: e)).toList()
        ),
      ),
    );
  }
}
