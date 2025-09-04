import 'package:flutter/material.dart';
import 'HautParleur.dart';

class Header extends StatelessWidget {
  final String titre;
  final String description;
  final ImageProvider image;
  final Widget? child;

  const Header({
    super.key,
    required this.titre,
    required this.description,
    required this.image,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Stack(
        children: [
          // Image de fond qui va être partiellement cachée par le contenu blanc
          Positioned.fill(
            child: Image(
              image: image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Overlay noir
          Container(color: Colors.black.withOpacity(0.5)),

          Positioned(
            bottom: 70,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitreHautParleur(
                  title: titre,
                  textSpeaker: titre,
                  textColor: Colors.white,
                  fontSize: 30,
                  hautParleurSize: 25,
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),

          // Bouton retour
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),

          if (child != null) child!,
        ],
      ),
    );
  }
}
