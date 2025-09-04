import 'package:flutter/material.dart';

class Favori extends StatefulWidget {
  final double size;

  const Favori({super.key, this.size = 50});

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Animation du pop
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.4), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Animation couleur avec accès au Theme
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Theme.of(context).colorScheme.secondary,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        _controller.forward(from: 0);
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
    return GestureDetector(
      onTap: _toggleLike,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: _colorAnimation.value,
              size: widget.size,
            ),
          );
        },
      ),
    );
  }
}
