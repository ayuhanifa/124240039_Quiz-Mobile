import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz 4 App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto', // Font standar yang bersih
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A194A)),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 156, 176, 235), // Transparan agar menyatu dengan gradasi
          foregroundColor: Color(0xFF0A194A), // Deep Blue Text
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A194A)),
        ),
      ),
      home: const MainScreen(),
    );
  }
}