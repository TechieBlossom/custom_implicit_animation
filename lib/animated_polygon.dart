import 'package:custom_implicit_animation/shape_painter.dart';
import 'package:flutter/material.dart';

class AnimatedPolygon extends ImplicitlyAnimatedWidget {
  const AnimatedPolygon({
    super.key,
    required super.duration,
    required this.offsets,
  });

  final List<Offset> offsets;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedPolygonState();
}

class _AnimatedPolygonState extends AnimatedWidgetBaseState<AnimatedPolygon> {
  //1
  final List<Tween<Offset>?> _offsetTweens = List.empty(growable: true);

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    final temp = List<Tween<Offset>?>.empty(growable: true);
    //2
    for (var i = 0; i < widget.offsets.length; i++) {
      //3
      final offsetTween =
          _offsetTweens.length >= i + 1 ? _offsetTweens[i] : null;
      //4
      final offset = visitor(
        offsetTween,
        widget.offsets[i],
        (dynamic value) => Tween<Offset>(begin: value as Offset),
      ) as Tween<Offset>?;
      //5
      temp.insert(i, offset);
    }
    //6
    _offsetTweens.isNotEmpty
        ? _offsetTweens.replaceRange(0, _offsetTweens.length, temp)
        : _offsetTweens.addAll(temp);
  }

  @override
  Widget build(BuildContext context) {
    //7
    final offsets = _offsetTweens
        .map((tween) => tween?.evaluate(animation) ?? Offset.zero)
        .toList();
    return CustomPaint(
      painter: ShapePainter(
        offsets: offsets,
      ),
    );
  }
}
