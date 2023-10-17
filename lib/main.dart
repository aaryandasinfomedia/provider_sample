import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider.dart';
import 'package:provider_sample/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SampleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Sample',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen()
      ),
    );
  }
}


