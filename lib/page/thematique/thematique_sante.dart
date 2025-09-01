import 'package:flutter/material.dart';

class ThematiqueSante extends StatelessWidget {
  const ThematiqueSante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Santé")),
      body: const Center(child: Text("Contenu de la page Santé")),
    );
  }
}
