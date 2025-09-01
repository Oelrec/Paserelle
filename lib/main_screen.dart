import 'package:flutter/material.dart';
import 'package:passerelle_tentative/page/home/home.dart';
import 'package:passerelle_tentative/page/agenda/agenda.dart';
import 'package:passerelle_tentative/page/favoris/favoris.dart';
import 'package:passerelle_tentative/page/parametres/parametres.dart';
import 'package:passerelle_tentative/page/annuaire/annuaire.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 2; // 2 = Accueil par défaut
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Annuaire(),
      Agenda(),
      HomePage(
        onSelectPage: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      Favoris(),
      Parametres(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: IndexedStack(
          key: ValueKey<int>(selectedIndex), // important pour AnimatedSwitcher
          index: selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 100, 96, 96).withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMenuButton(Icons.book, 0), // Annuaire
            _buildMenuButton(Icons.calendar_today, 1), // Agenda
            _buildMenuButton(Icons.home, 2, isHome: true), // Accueil rond
            _buildMenuButton(Icons.favorite, 3), // Favoris
            _buildMenuButton(Icons.settings, 4), // Paramètres
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, int index, {bool isHome = false}) {
    bool isSelected = selectedIndex == index;

    double size = isHome ? 65 : 60; // bouton home plus gros
    double radius = isHome ? 35 : 10; // plus rond si home

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[300],
          borderRadius: BorderRadius.circular(radius),
          boxShadow: isHome
              ? [
                  const BoxShadow(
                    color: Color.fromARGB(255, 84, 84, 84),
                    blurRadius: 8,
                    offset: Offset(0, 4), // léger relief
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey[700],
          size: isHome ? 40 : 32, // icône un peu plus grande
        ),
      ),
    );
  }
}
