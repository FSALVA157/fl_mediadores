import 'package:flutter/material.dart';

class AnimatedWidget extends StatelessWidget {
  final double progress;

  const AnimatedWidget({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _currentImageSize = (120 * (1 - this.progress)).clamp(95, 120);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(bottom: 20),
      width: _currentImageSize,
      height: _currentImageSize,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black38,
        image: DecorationImage(
          image: AssetImage('assets/manos.png'),
          fit: BoxFit.fill
          )
      ),
      alignment: Alignment.lerp(
          Alignment.bottomCenter,
          Alignment.topCenter,
          progress),
      );
  }
}