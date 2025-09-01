import 'package:flutter/material.dart';

class ThematiqueVieQuotidienne extends StatelessWidget {
  const ThematiqueVieQuotidienne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vie Quotidienne")),
      body: const Center(child: Text("Contenu de la page Vie Quotidienne")),
    );
  }
}
