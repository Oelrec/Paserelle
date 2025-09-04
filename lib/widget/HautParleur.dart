import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HautParleur extends StatefulWidget {
  final Color? color;
  final double size;
  final String textspeaker;

  const HautParleur({
    super.key,
    this.color,
    required this.size,
    required this.textspeaker,
  });

  @override
  State<HautParleur> createState() => _HautParleurState();
}

class _HautParleurState extends State<HautParleur>
    with SingleTickerProviderStateMixin {
  final _tts = FlutterTts();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.8,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  Future<void> _speak() async {
    // On joue l'animation
    await _controller.reverse(); // réduit l'icône
    await _controller.forward(); // revient à la taille normale

    await _tts.setLanguage("fr-FR");
    await _tts.setSpeechRate(0.5);
    await _tts.speak(widget.textspeaker);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _speak,
      child: ScaleTransition(
        scale: _controller,
        child: Icon(
          Icons.volume_up,
          color: widget.color ?? Theme.of(context).colorScheme.secondary,
          size: widget.size,
        ),
      ),
    );
  }
}

class TitreHautParleur extends StatelessWidget {
  final String title;
  final String? textSpeaker; // texte optionnel pour le HautParleur
  final Color textColor;
  final double fontSize;
  final double hautParleurSize;
  final Color? hautParleurColor;

  const TitreHautParleur({
    super.key,
    required this.title,
    this.textSpeaker,
    this.textColor = Colors.black,
    this.fontSize = 30,
    this.hautParleurColor,
    this.hautParleurSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
            height: 1,
          ),
        ),
        const SizedBox(width: 8),
        HautParleur(
          color: hautParleurColor ?? Colors.black,
          size: hautParleurSize,
          textspeaker: textSpeaker ?? title,
        ),
      ],
    );
  }
}
