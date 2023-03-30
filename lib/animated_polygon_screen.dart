import 'package:custom_implicit_animation/animated_polygon.dart';
import 'package:flutter/material.dart';

enum PolygonType {
  scaleneTriangle,
  square,
  kite,
  regularPentagon,
}

class AnimatedPolygonScreen extends StatefulWidget {
  const AnimatedPolygonScreen({super.key});

  @override
  State<AnimatedPolygonScreen> createState() => _AnimatedPolygonScreenState();
}

class _AnimatedPolygonScreenState extends State<AnimatedPolygonScreen> {
  final _width = 280.0;
  final _height = 280.0;
  late PolygonType _polygonType;

  @override
  void initState() {
    super.initState();
    _polygonType = PolygonType.scaleneTriangle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Implicit Animation Widget')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _width,
            height: _height,
            child: AnimatedPolygon(
              duration: const Duration(seconds: 1),
              offsets: _offsets(),
            ),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () => _setPolygonType(PolygonType.scaleneTriangle),
                  child: const Text('Scalene Triangle'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () => _setPolygonType(PolygonType.square),
                  child: const Text('Square'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () => _setPolygonType(PolygonType.kite),
                  child: const Text('Kite'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () => _setPolygonType(PolygonType.regularPentagon),
                  child: const Text('Regular Pentagon'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Offset> _offsets() {
    switch (_polygonType) {
      case PolygonType.scaleneTriangle:
        return scaleneTriangleOffsets;
      case PolygonType.square:
        return squareOffsets;
      case PolygonType.kite:
        return kiteOffsets;
      case PolygonType.regularPentagon:
        return regularPentagonOffsets;
    }
  }

  void _setPolygonType(PolygonType polygonType) =>
      setState(() => _polygonType = polygonType);

  List<Offset> get scaleneTriangleOffsets => [
        Offset(_width * 0.1, _height * 0.9),
        Offset(_width * 0.3, _height * 0.1),
        Offset(_width * 0.9, _height * 0.9),
      ];

  List<Offset> get squareOffsets => [
        Offset(_width * 0.2, _height * 0.2),
        Offset(_width * 0.8, _height * 0.2),
        Offset(_width * 0.8, _height * 0.8),
        Offset(_width * 0.2, _height * 0.8),
      ];

  List<Offset> get kiteOffsets => [
        Offset(_width * 0.1, _height * 0.5),
        Offset(_width * 0.4, _height * 0.2),
        Offset(_width * 0.9, _height * 0.5),
        Offset(_width * 0.4, _height * 0.8)
      ];

  List<Offset> get regularPentagonOffsets => [
        Offset(_width * 0.2, _height * 0.4),
        Offset(_width * 0.5, _height * 0.2),
        Offset(_width * 0.8, _height * 0.4),
        Offset(_width * 0.7, _height * 0.8),
        Offset(_width * 0.3, _height * 0.8),
      ];
}
