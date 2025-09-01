import 'package:flutter/material.dart';

import 'package:passerelle_tentative/main_screen.dart'; // Scaffold principal avec menu bas

const Color couleurPrincipale = Color.fromARGB(255, 0, 119, 255);
const Color couleurSecondaire = Color(0xFF00AC6C);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Passerelle",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: couleurPrincipale,
        colorScheme: ColorScheme.fromSeed(
          seedColor: couleurPrincipale,
          secondary: couleurSecondaire,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      home: const MainScreen(), // <- lancement du Scaffold central
    );
  }
}
