import 'package:flutter/material.dart';
import 'package:provider_sample/screens/basic_counter_example.dart';
import 'package:provider_sample/screens/favourite_screen.dart';
import 'package:provider_sample/screens/slider_example.dart';
import 'package:provider_sample/screens/theme_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BasicCounterExample(),)),
            child: Text('Count Example')),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SliderExampleScreen(),)),
            child: Text('Slider Example')),

            SizedBox(
              height: 15,
            ),
            ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteExampleScreen(),)),
            child: Text('Favourite Example')),

            SizedBox(
              height: 15,
            ),
            ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeChangeScreen(),)),
            child: Text('Theme Example')),
          ],
        ),
      ),
    );
  }
}
