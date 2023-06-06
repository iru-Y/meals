import 'package:flutter/material.dart';
import 'package:meals/untils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    Widget createItem (IconData icon, String label, void Function() onTap){
      return ListTile(
        leading: Icon(
          icon,
          size: 26),
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        onTap: onTap
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary
              ),
            ),
          ),
          createItem(
            Icons.restaurant,
             'Refeições',
             ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.home)
              ),
          const SizedBox(height: 20),
          createItem(
            Icons.settings,
             'Configurações',
             ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.settings)
             )
        ],
      ),
    );
  }
}