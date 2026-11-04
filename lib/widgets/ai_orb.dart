

import 'package:flutter/material.dart';

class AiOrb extends StatelessWidget {
  final double size;

  const AiOrb({
    super.key,
    this.size = 190,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [
            Colors.white,
            Color(0xFFB8D6FF),
            Color(0xFF3978F6),
            Color(0xFF1554C8),
          ],
          stops: [0.1, 0.45, 0.75, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3978F6).withOpacity(0.35),
            blurRadius: 40,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.auto_awesome_rounded,
          color: Colors.white,
          size: size * 0.36,
        ),
      ),
    );
  }
}
