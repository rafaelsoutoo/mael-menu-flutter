import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
 const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings!);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: const MainDrawer(),
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Configurações',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'só exibe refeições sem glutén',
                  settings!.isGlutenFree,
                  (value) => setState(() {
                    settings!.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  'Sem lactose',
                  'só exibe refeições sem lactose',
                  settings!.isLactoseFree,
                  (value) => setState(() {
                    settings!.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  'Vegana',
                  'só exibe refeições sveganas!',
                  settings!.isVegan,
                  (value) => setState(() {
                    settings!.isVegan = value;
                  }),
                ),
                _createSwitch(
                  'Vegetarianas',
                  'só exibe refeições vegetarianas',
                  settings!.isVegetarian,
                  (value) => setState(() {
                    settings!.isVegetarian = value;
                  }),
                ),
              ],
            ))
          ],
        ));
  }
}
