import 'package:fish_delivery_app/models/fishmarket.dart';
import 'package:flutter/material.dart';
import 'package:fish_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:fish_delivery_app/splash_screen.dart'; // Import the splash screen

void main() {
  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // fishmarket provider
        ChangeNotifierProvider(create: (context) => Fishmarket()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenState(), // Set SplashScreenState as initial route
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
