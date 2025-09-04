import 'package:flutter/material.dart';
import 'BoutonExtensible_Annuaire.dart';
import 'BlocAnnuaire.dart';

class BlocCategorieAnnuaire extends StatelessWidget {
  final String categorie;
  final List<Map<String, String>> organisations;

  const BlocCategorieAnnuaire({
    super.key,
    required this.categorie,
    required this.organisations,
  });

  @override
  Widget build(BuildContext context) {
    return BoutonExpansibleAnnuaire(
      titrePrincipal: categorie,
      description: "Cliquez pour voir les organisations",
      adresse: "",
      mail: "",
      phone: "",
      initiallyOpen: false, // catégorie ouverte par défaut
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: organisations.map((org) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Annuaire(
              titre: org["titre"]!,
              description: org["description"]!,
              adresse: org["adresse"]!,
              mail: org["mail"]!,
              phone: org["phone"]!,
            ),
          );
        }).toList(),
      ),
    );
  }
}
