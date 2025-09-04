import 'package:flutter/material.dart';
import '../../widget/HautParleur.dart';
import '../../widget/OngletSwitch.dart';
import '../../widget/BoutonExtensible.dart';
import '../../widget/BlocCategorieannuaire.dart';

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
      body: PageThematique_Template(
        backgroundImage: 'assets/images/photo_manif.jpg',
        title: "Régularisation",
        subtitle: "Petite description ici",
        bottomContent: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OngletSwitch(
                texteGauche: 'Vos droits',
                texteDroite: 'Annuaire',
                onChanged: _onTabChanged,
              ),
            ),
            _pages[_selectedIndex],
          ],
        ),
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
  final List<Map<String, String>> associations = [
    {
      "titre": "La Cimade",
      "description": "Permanence tous les samedis",
      "adresse": "5 rue Jules Vicq",
      "mail": "contact@cimade.fr",
      "phone": "0123456789",
    },
    {
      "titre": "XYZ",
      "description": "Activités pour les jeunes",
      "adresse": "10 rue Exemple",
      "mail": "contact@xyz.fr",
      "phone": "0987654321",
    },
    {
      "titre": "LDH LILLE",
      "description": "Activités pour les jeunes",
      "adresse": "10 rue Exemple",
      "mail": "contact@xyz.fr",
      "phone": "0987654321",
    },
  ];

  final List<Map<String, String>> syndicats = [
    {
      "titre": "Syndicat ABC",
      "description": "Aide aux salariés",
      "adresse": "1 rue Syndicat",
      "mail": "abc@syndicat.fr",
      "phone": "011223344",
    },
    {
      "titre": "Syndicat CGT",
      "description": "Aide aux salariés",
      "adresse": "1 rue Syndicat",
      "mail": "abc@syndicat.fr",
      "phone": "011223344",
    },
    {
      "titre": "Syndicat Solidaire",
      "description": "Aide aux salariés",
      "adresse": "1 rue Syndicat",
      "mail": "abc@syndicat.fr",
      "phone": "011223344",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocCategorieAnnuaire(
            categorie: "Associations",
            organisations: associations,
          ),
          BlocCategorieAnnuaire(
            categorie: "Syndicats",
            organisations: syndicats,
          ),
        ],
      ),
    );
  }
}

class PageThematique_Template extends StatelessWidget {
  final String backgroundImage;
  final VoidCallback? onBack;
  final String title;
  final String? subtitle;
  final Widget bottomContent;

  const PageThematique_Template({
    super.key,
    required this.backgroundImage,
    this.onBack,
    required this.title,
    this.subtitle,
    required this.bottomContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGE DE FOND
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // CONTENU SCROLLABLE
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BOUTON RETOUR
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: GestureDetector(
                    onTap: onBack ?? () => Navigator.pop(context),
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

                const SizedBox(height: 20),

                // TITRE
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TitreHautParleur(
                    title: title,
                    textColor: Colors.white,
                    fontSize: 27,
                    hautParleurSize: 30,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],

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
                  child: bottomContent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
