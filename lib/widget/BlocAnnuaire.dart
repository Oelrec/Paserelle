import 'package:flutter/material.dart';
import 'package:passerelle_tentative/widget/HautParleur.dart';

class Annuaire extends StatelessWidget {
  final String titre;
  final String description;
  final String adresse;
  final String mail;
  final String phone;

  const Annuaire({
    super.key,
    required this.titre,
    required this.description,
    required this.adresse,
    required this.mail,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitreHautParleur(
            title: titre,
            textSpeaker:
                "$titre organise $description à $adresse. Vous pouvez les contacter via mail ou téléphone.",
            textColor: Theme.of(context).colorScheme.secondary,
            hautParleurColor: Theme.of(context).colorScheme.secondary,
            fontSize: 20,
            hautParleurSize: 25,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.place, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(width: 5),
              Text(
                adresse,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.mail, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(width: 5),
              Text(
                mail,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(width: 5),
              Text(
                phone,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
