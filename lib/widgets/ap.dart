import 'package:custom_implicit_animation/sizes.dart';
import 'package:custom_implicit_animation/widgets/dot.dart';
import 'package:flutter/material.dart';

class AP extends StatelessWidget {
  const AP({
    super.key,
    required this.offset,
  });

  final Offset offset;

  @override
  Widget build(BuildContext context) {
    const size = Sizes.dotSize;
    const radius = size / 2;
    return AnimatedPositioned.fromRect(
      rect: Rect.fromCenter(
        center: offset + const Offset(radius, radius),
        width: size,
        height: size,
      ),
      curve: Curves.linearToEaseOut,
      duration: const Duration(seconds: 2),
      child: const Dot(radius: radius),
    );
  }
}
