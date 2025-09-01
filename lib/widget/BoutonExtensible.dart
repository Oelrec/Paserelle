import 'package:flutter/material.dart';
import 'package:passerelle_tentative/widget/HautParleur.dart';

class BoutonExpansible extends StatefulWidget {
  final String titrePrincipal;
  final List<String> sousItems;

  const BoutonExpansible({
    super.key,
    required this.titrePrincipal,
    required this.sousItems,
  });

  @override
  State<BoutonExpansible> createState() => _BoutonExpansibleState();
}

class _BoutonExpansibleState extends State<BoutonExpansible>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _flechePivotable;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _heightAnimation = Tween<double>(
      begin: 0,
      end: widget.sousItems.length * 50.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

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
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: _toggleOpen, // au clic, on bascule ouvert/fermé
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white, // fond blanc
            border: Border.all(color: Colors.black, width: 1.5), // contour noir
            borderRadius: BorderRadius.circular(8),
            // coins arrondis
          ), // juste pour voir le bouton
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HautParleur(
                          blanc: false,
                          size: 35,
                          textspeaker: widget.titrePrincipal,
                        ),
                        Text(
                          widget.titrePrincipal,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1.0,
                          ),
                          softWrap: true,
                          maxLines: null,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                  RotationTransition(
                    turns: _flechePivotable,
                    child: const Icon(Icons.expand_more, size: 40),
                  ),
                ],
              ),

              SizeTransition(
                sizeFactor: _controller.drive(Tween<double>(begin: 0, end: 1)),
                axisAlignment: -1.0,
                child: Column(
                  children: widget.sousItems
                      .map((item) => ListTile(title: Text(item)))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
