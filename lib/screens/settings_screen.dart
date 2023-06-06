import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import '../models/settings_model.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    SettingsModel settingsModel = SettingsModel();

    Widget createSwitch(String title, String subtitle, bool value, void Function (bool) onChanged){
      return SwitchListTile.adaptive(
          title: Text(title),
          subtitle: Text(subtitle),
          value: value,
          onChanged: onChanged
      );
    }
    

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          ),
          drawer: const MainDrawer(),
        body: Column(
            children: [
              Container(
                padding : const EdgeInsets.all(16),
                child: Text('Configurações',
                style: Theme.of(context).textTheme.titleMedium,),
              ),
              Expanded(
                child: ListView(
                  children: [
                    createSwitch(
                    'Sem glúten',
                    'Só exibe informações sem glúten',
                    settingsModel.isGlutenFree,
                    (value) => setState(() {
                      settingsModel.isGlutenFree = value;
                    })
                  ),
                  createSwitch(
                    'Sem lactose',
                    'Só exibe informações sem lactose',
                    settingsModel.isLactoseFree,
                    (value) => setState(() {
                      settingsModel.isLactoseFree = value;
                    })
                  ),
                  createSwitch(
                    'Vegana',
                    'Só exibe informações vegana',
                    settingsModel.isVegan,
                    (value) => setState(() {
                      settingsModel.isVegan = value;
                    })
                  ),
                    createSwitch(
                    'Vegetarianas',
                    'Só exibe informações vegetarianas',
                    settingsModel.isVegetarian,
                    (value) => setState(() {
                      settingsModel.isVegetarian = value;
                    })
                  )
                  ],
                )
                )
            ],
        ),
        ),
      );
  }
}