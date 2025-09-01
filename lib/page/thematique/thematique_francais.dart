import 'package:flutter/material.dart';

class ThematiqueFrancais extends StatelessWidget {
  const ThematiqueFrancais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Français")),
      body: const Center(child: Text("Contenu de la page Français")),
    );
  }
}
