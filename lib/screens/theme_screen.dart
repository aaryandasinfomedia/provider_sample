import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers/theme_provider.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({super.key});

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Light'),
            value: ThemeMode.light,
            groupValue: Provider.of<ThemeProvider>(context).themeMode,
            onChanged: Provider.of<ThemeProvider>(context).setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('Dark'),
            value: ThemeMode.dark,
            groupValue: Provider.of<ThemeProvider>(context).themeMode,
            onChanged: Provider.of<ThemeProvider>(context).setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('System'),
            value: ThemeMode.system,
            groupValue: Provider.of<ThemeProvider>(context).themeMode,
            onChanged: Provider.of<ThemeProvider>(context).setTheme,
          ),
        ],
      ),
    );
  }
}
