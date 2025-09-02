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
      body: Stack(
        children: [
          // IMAGE DE FOND
          Container(
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/photo_manif.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),

          // CONTENU SCROLLABLE
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),

                // TITRE
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TitreHautParleur(
                    title: "Régularisation",
                    textColor: Colors.white,
                    fontSize: 27,
                    hautParleurBlanc: true,
                    hautParleurSize: 30,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Petite description ici",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      height: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // BLOC BLANC
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: OngletSwitch(
                            texteGauche: 'Vos droits',
                            texteDroite: 'Annuaire',
                            onChanged: _onTabChanged,
                          ),
                        ),
                        // Contenu scrollable interne
                        _pages[_selectedIndex],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // BOUTON RETOUR
          Positioned(
            top: 40,
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
