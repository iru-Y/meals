import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import '../models/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsModel settingsModel;
  final Function(SettingsModel) onSettingsChanged;

  const SettingsScreen(
      {super.key,
      required this.onSettingsChanged,
      required this.settingsModel});
  

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

   SettingsModel settingsModel = SettingsModel();

    @override
    void initState() {
      super.initState();
      settingsModel = widget.settingsModel;
    }

    Widget createSwitch(String title, String subtitle, bool value,
        void Function(bool) onChanged) {
      return SwitchListTile.adaptive(
          title: Text(title),
          subtitle: Text(subtitle),
          value: value,
          onChanged: (value) {
            onChanged(value);
            widget.onSettingsChanged(settingsModel);
          });
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleMedium,
              ),
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
                        })),
                createSwitch(
                    'Sem lactose',
                    'Só exibe informações sem lactose',
                    settingsModel.isLactoseFree,
                    (value) => setState(() {
                          settingsModel.isLactoseFree = value;
                        })),
                createSwitch(
                    'Vegana',
                    'Só exibe informações vegana',
                    settingsModel.isVegan,
                    (value) => setState(() {
                          settingsModel.isVegan = value;
                        })),
                createSwitch(
                    'Vegetarianas',
                    'Só exibe informações vegetarianas',
                    settingsModel.isVegetarian,
                    (value) => setState(() {
                          settingsModel.isVegetarian = value;
                        }))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
