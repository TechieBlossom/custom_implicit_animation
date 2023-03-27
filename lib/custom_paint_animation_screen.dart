import 'package:custom_implicit_animation/shape_painter.dart';
import 'package:flutter/material.dart';

class CustomPaintAnimationScreen extends StatefulWidget {
  const CustomPaintAnimationScreen({super.key});

  @override
  State<CustomPaintAnimationScreen> createState() =>
      _CustomPaintAnimationScreenState();
}

class _CustomPaintAnimationScreenState extends State<CustomPaintAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset1;
  late Animation<Offset> _offset2;
  late Animation<Offset> _offset3;
  late Animation<Offset> _offset4;

  final _width = 280.0;
  final _height = 280.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _offset1 = Tween<Offset>(
      begin: Offset(_width * 0.2, _height * 0.2),
      end: Offset(_width * 0.0, _height * 0.2),
    ).animate(_controller);

    _offset2 = Tween<Offset>(
      begin: Offset(_width * 0.8, _height * 0.2),
      end: Offset(_width * 1.0, _height * 0.2),
    ).animate(_controller);

    _offset3 = Tween<Offset>(
      begin: Offset(_width * 0.8, _height * 0.8),
      end: Offset(_width * 1.0, _height * 0.8),
    ).animate(_controller);

    _offset4 = Tween<Offset>(
      begin: Offset(_width * 0.2, _height * 0.8),
      end: Offset(_width * 0.0, _height * 0.8),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Paint Animation Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: _width,
            height: _height,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: ShapePainter(
                    offset1: _offset1.value,
                    offset2: _offset2.value,
                    offset3: _offset3.value,
                    offset4: _offset4.value,
                  ),
                  child: child,
                );
              },
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => _controller.forward(),
                child: const Text('Rectangle'),
              ),
              FilledButton(
                onPressed: () => _controller.reverse(),
                child: const Text('Square'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
