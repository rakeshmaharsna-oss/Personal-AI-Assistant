
import 'package:flutter/material.dart';

class VoiceIndicator extends StatelessWidget {
  final bool isListening;

  const VoiceIndicator({
    super.key,
    this.isListening = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final heights = [
          16.0,
          28.0,
          42.0,
          28.0,
          16.0,
        ];

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 7,
          height: isListening ? heights[index] : 8,
          decoration: BoxDecoration(
            color: const Color(0xFF3978F6),
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
