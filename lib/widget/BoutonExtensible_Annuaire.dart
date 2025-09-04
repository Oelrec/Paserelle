import 'package:flutter/material.dart';
import 'BlocAnnuaire.dart';
import 'package:passerelle_tentative/widget/HautParleur.dart';

class BoutonExpansibleAnnuaire extends StatefulWidget {
  final bool initiallyOpen;
  final String titrePrincipal;
  final String description;
  final String adresse;
  final String mail;
  final String phone;
  final Widget? child; // contenu customisable

  const BoutonExpansibleAnnuaire({
    super.key,
    required this.titrePrincipal,
    required this.description,
    required this.adresse,
    required this.mail,
    required this.phone,
    this.child,
    this.initiallyOpen = false,
  });

  @override
  State<BoutonExpansibleAnnuaire> createState() =>
      _BoutonExpansibleAnnuaireState();
}

class _BoutonExpansibleAnnuaireState extends State<BoutonExpansibleAnnuaire>
    with SingleTickerProviderStateMixin {
  late bool _isOpen;
  late AnimationController _controller;
  late Animation<double> _flechePivotable;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.initiallyOpen;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    if (_isOpen) _controller.value = 1.0;

    _flechePivotable = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleOpen() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: GestureDetector(
        onTap: _toggleOpen,
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HautParleur(
                color: Colors.black,
                size: 35,
                textspeaker: widget.titrePrincipal,
              ),
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.titrePrincipal,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _flechePivotable,
                    child: const Icon(Icons.expand_more, size: 40),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // contenu extensible
              SizeTransition(
                sizeFactor: _controller.drive(Tween<double>(begin: 0, end: 1)),
                axisAlignment: -1.0,
                child:
                    widget.child ??
                    Annuaire(
                      titre: widget.titrePrincipal,
                      description: widget.description,
                      adresse: widget.adresse,
                      mail: widget.mail,
                      phone: widget.phone,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
