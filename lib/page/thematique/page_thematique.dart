import 'package:flutter/material.dart';
import '../../widget/HautParleur.dart';
import '../../widget/OngletSwitch.dart';
import '../../widget/BoutonExtensible.dart';
import 'thematique_controle.dart';

// Page thématique principale
class PageThematique extends StatefulWidget {
  const PageThematique({super.key});

  @override
  State<PageThematique> createState() => _PageThematiqueState();
}

class _PageThematiqueState extends State<PageThematique> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    VosDroitsBloc(), // Bloc "Vos droits"
    AnnuaireBloc(), // Bloc "Annuaire"
  ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header en haut
          Header(
            titre: 'Régularisation',
            description: 'Petite description ici',
            image: AssetImage('assets/images/photo_manif.jpg'),
          ),

          // Onglet switch pour changer de bloc
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OngletSwitch(
              texteGauche: 'Vos droits',
              texteDroite: 'Annuaire',
              onChanged: _onTabChanged,
            ),
          ),

          // Bloc correspondant à l'onglet sélectionné
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String titre;
  final String description;
  final ImageProvider image;

  const Header({
    super.key,
    required this.titre,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          // Image de fond
          Image(
            image: image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Overlay noir
          Container(color: Colors.black.withOpacity(0.5)),
          // Texte et haut-parleur
          Positioned(
            bottom: 30,
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
                  hautParleurBlanc: true,
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
        ],
      ),
    );
  }
}

// Bloc pour "Vos droits"
class VosDroitsBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Contenu Vos droits', style: TextStyle(fontSize: 18)),

          BoutonExpansible(
            titrePrincipal: "Mes options",
            sousItems: ["Page A", "Page B", "Page C"],
            onItemTap: (item) {
              if (item == "Page A") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThematiqueControle()),
                );
              } else if (item == "Page B") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThematiqueControle()),
                );
              } else if (item == "Page C") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThematiqueControle()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// Bloc pour "Annuaire"
class AnnuaireBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contenu Annuaire', style: TextStyle(fontSize: 18)),
    );
  }
}
