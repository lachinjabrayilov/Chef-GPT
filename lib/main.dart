import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chef GPT',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Sistem temasına göre değişir
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
