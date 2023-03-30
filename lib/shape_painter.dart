import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ShapePainter extends CustomPainter {
  ShapePainter({
    required this.offsets,
  });

  //1
  final List<Offset?> offsets;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 4.0)
      ..strokeWidth = 5.0;

    //2
    final nonNullableOffsets =
        offsets.where((element) => null != element).toList() as List<Offset>;

    canvas.drawPoints(
      PointMode.polygon,
      [
        ...nonNullableOffsets,
        nonNullableOffsets.first,
      ],
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
