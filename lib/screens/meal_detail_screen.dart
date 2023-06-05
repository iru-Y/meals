import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 330,
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      meal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              )),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index){
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    );
                })
                )
            ],
          ),
        ));
  }
}
