import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ShapePainter extends CustomPainter {
  ShapePainter({
    required this.offset1,
    required this.offset2,
    required this.offset3,
    required this.offset4,
  });

  final Offset offset1;
  final Offset offset2;
  final Offset offset3;
  final Offset offset4;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 4.0)
      ..strokeWidth = 5.0;

    canvas.drawPoints(
      PointMode.polygon,
      [offset1, offset2, offset3, offset4, offset1],
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
