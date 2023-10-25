import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/screens/home_screen.dart';
import 'package:provider_sample/providers/simple_provider.dart';
import 'package:provider_sample/providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SampleProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
              themeMode: Provider.of<ThemeProvider>(context).themeMode,
              debugShowCheckedModeBanner: false,
              title: 'Provider Sample',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.deepOrange
              ),
              highContrastTheme: ThemeData(
                brightness: Brightness.dark
              ),
              home: const HomeScreen()
          );
        },
      ),
    );
  }
}


