import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromRadius(radius),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}
