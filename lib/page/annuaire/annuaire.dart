import 'package:flutter/material.dart';

class Annuaire extends StatelessWidget {
  const Annuaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Annuaire")),
      body: const Center(child: Text("Contenu de la page Annuaire")),
    );
  }
}
