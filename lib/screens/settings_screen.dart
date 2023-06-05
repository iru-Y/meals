import 'package:flutter/material.dart';
import 'package:meals/untils/app_routes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
                const Text('Configurações'),
            ],
          ),

        ),
        body: const Center(
          child: Text('Configurações'),
        ),
      ),
    );
  }
}