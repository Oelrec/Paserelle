import 'package:flutter/material.dart';

class Favoris extends StatelessWidget {
  const Favoris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoris")),
      body: const Center(child: Text("Contenu de la page Favoris")),
    );
  }
}
