import 'package:flutter/material.dart';
import 'package:passerelle_tentative/widget/HautParleur.dart';

class OngletSwitch extends StatefulWidget {
  final String texteGauche;
  final String texteDroite;
  final ValueChanged<int>? onChanged;

  const OngletSwitch({
    super.key,
    required this.texteGauche,
    required this.texteDroite,
    this.onChanged,
  });

  @override
  State<OngletSwitch> createState() => _OngletSwitchState();
}

class _OngletSwitchState extends State<OngletSwitch> {
  int _selectedIndex = 0;

  void _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (widget.onChanged != null) widget.onChanged!(index);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double totalWidth = screenWidth * 0.9; // 90% de l'écran
    final double halfWidth = totalWidth / 2;

    return Container(
      height: 60,
      width: totalWidth,
      decoration: BoxDecoration(
        color: Color(0xFFE4E4E4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          // Indicateur bleu animé
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            left: _selectedIndex == 0 ? 0 : halfWidth,
            top: 0,
            bottom: 0,
            child: Container(
              width: halfWidth,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectIndex(0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HautParleur(
                          blanc: _selectedIndex == 0,
                          size: 30,
                          textspeaker: widget.texteGauche,
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.texteGauche,
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectIndex(1),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HautParleur(
                          blanc: _selectedIndex == 1,
                          size: 30,
                          textspeaker: widget.texteDroite,
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.texteDroite,
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
