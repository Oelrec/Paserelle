import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:passerelle_tentative/page/thematique/thematique_regularisation.dart';
import 'package:passerelle_tentative/page/thematique/page_thematique.dart';

import '../../widget/HautParleur.dart';
import 'package:passerelle_tentative/page/thematique/thematique_controle.dart';
import 'package:passerelle_tentative/page/thematique/thematique_francais.dart';
import 'package:passerelle_tentative/page/thematique/thematique_sante.dart';
import 'package:passerelle_tentative/page/thematique/thematique_travail.dart';
import 'package:passerelle_tentative/page/thematique/thematique_vie_quotidienne.dart';

class HomePage extends StatefulWidget {
  final Function(int) onSelectPage;

  const HomePage({super.key, required this.onSelectPage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts flutterTts = FlutterTts();

  final event = Event(
    jour: "10",
    mois: "Septembre",
    titre: "Permanence d’accès au droit",
    organisateur: "Ligue des droits de l’homme",
    lieu: "MRES de Lille",
    adresse: "5 rue Jules Vicq, Métro Fives",
    horaires: "15h-20h",
  );

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("fr-FR");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 43, 107, 255),
              Color.fromARGB(255, 0, 29, 245),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: const Text(
                  "Passerelle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: const Text(
                  "Toutes les infos pour faciliter votre vie quotidienne en France",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      TitreHautParleur(
                        title: "Prochaines permanances",
                        textColor: Colors.black,
                        hautParleurColor: Colors.black,
                        fontSize: 27,
                        hautParleurSize: 30,
                      ),

                      const SizedBox(height: 10),

                      EvenementCard(
                        event:
                            event, // l'objet Event que tu as créé dans ton State
                        onTap: () =>
                            widget.onSelectPage(1), // navigation vers Agenda
                      ),

                      SizedBox(height: 15),

                      TitreHautParleur(
                        title: "Les thématiques",
                        hautParleurColor: Colors.black,

                        textColor: Colors.black,
                        fontSize: 27,
                        hautParleurSize: 30,
                      ),
                      SizedBox(height: 10),

                      GridView.count(
                        crossAxisCount:
                            MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 2
                            : 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        padding: const EdgeInsets.all(5),
                        childAspectRatio:
                            MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 1
                            : 1.8, // ← ajuste la hauteur
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          BoutonThematique(
                            titre: "Régularisation",
                            icone: Icons.description,
                            page: PageThematique(),
                          ),

                          BoutonThematique(
                            titre: "Santé",
                            icone: Icons.medical_services,
                            page: ThematiqueSante(),
                          ),

                          BoutonThematique(
                            titre: "Contrôle d’identité",
                            icone: Icons.perm_identity,
                            page: ThematiqueControle(),
                          ),

                          BoutonThematique(
                            titre: "Travail",
                            icone: Icons.work,
                            page: ThematiqueTravail(),
                          ),

                          BoutonThematique(
                            titre: "Vie quotidienne",
                            icone: Icons.home,
                            page: ThematiqueVieQuotidienne(),
                          ),

                          BoutonThematique(
                            titre: "Apprendre le français",
                            icone: Icons.school,
                            page: ThematiqueFrancais(),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      TitreHautParleur(
                        title: "Les aides près de chez moi",
                        textSpeaker:
                            "Les aides près de chez moi. Rendez-vous sur la page Annuaire pour découvrir les aides disponibles près de chez vous : associations, structures publiques, et bien plus encore.",
                        textColor: Colors.black,
                        fontSize: 27,
                        hautParleurSize: 30,
                      ),

                      SizedBox(height: 15),

                      AnnuaireCard(
                        titre: "Annuaire",
                        typesAide: "Association\nStructures publiques\nEtc...",
                        image: AssetImage("assets/images/photo_manif.jpg"),
                        onTap: () {
                          setState(() {
                            widget.onSelectPage(
                              0,
                            ); // 0 = index de la page Annuaire dans MainScreen
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoutonThematique extends StatelessWidget {
  final String titre;
  final IconData icone;
  final Widget page;

  const BoutonThematique({
    super.key,
    required this.titre,
    required this.icone,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2B83FF), Color(0xFF0066F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Icône principale légèrement décalée vers le haut
            Center(
              child: FractionalTranslation(
                translation: const Offset(0, -0.1),
                child: Icon(icone, color: Colors.white, size: 80),
              ),
            ),

            // Icône speaker en haut à droite
            Positioned(
              top: 8,
              right: 8,
              child: HautParleur(
                color: Colors.white,
                size: 30,
                textspeaker: titre,
              ),
            ),

            // Texte en bas
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Text(
                titre,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String jour;
  final String mois;
  final String titre;
  final String organisateur;
  final String lieu;
  final String adresse;
  final String horaires;

  Event({
    required this.jour,
    required this.mois,
    required this.titre,
    required this.organisateur,
    required this.lieu,
    required this.adresse,
    required this.horaires,
  });

  // Génère la phrase à lire par le haut-parleur
  String toSpeechText() {
    return "La prochaine permanence est le $jour $mois "
        "par $organisateur à $lieu au $adresse de $horaires. "
        "Pour voir les autres permanences allez sur la page agenda.";
  }
}

class EvenementCard extends StatelessWidget {
  final Event event;
  final VoidCallback? onTap;

  const EvenementCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Partie date
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.jour,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      Text(
                        event.mois,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 3,
                  height: 150,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                // Partie infos
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          event.titre,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          event.organisateur,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          event.lieu,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          event.adresse,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          event.horaires,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 🔊 HautParleur
            Positioned(
              left: 8,
              top: 1,
              child: HautParleur(
                color: Colors.white,
                size: 30,
                textspeaker: event.toSpeechText(), // 👈 dynamique
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnuaireCard extends StatelessWidget {
  final String titre;
  final String typesAide;
  final ImageProvider image;
  final VoidCallback? onTap; //// callback passée par le parent

  const AnnuaireCard({
    required this.titre,
    required this.typesAide,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Image à gauche
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),

            // Espace entre image et texte
            const SizedBox(width: 10),

            // Texte à droite
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titre,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      typesAide,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text(
                          "En voir plus",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
