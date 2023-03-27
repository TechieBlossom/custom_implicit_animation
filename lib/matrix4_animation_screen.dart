import 'package:flutter/material.dart';

class Matrix4AnimationScreen extends StatefulWidget {
  const Matrix4AnimationScreen({super.key});

  @override
  State<Matrix4AnimationScreen> createState() => _Matrix4AnimationScreenState();
}

class _Matrix4AnimationScreenState extends State<Matrix4AnimationScreen>
    with SingleTickerProviderStateMixin {
  double _width = 200;
  final _height = 200.0;
  late AnimationController _controller;
  late Animation<double> _skewX;
  late Animation<Matrix4> _matrix4;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _skewX = Tween<double>(begin: 0.0, end: -0.4).animate(_controller);

    // Uncomment this to Change complete Matrix4
    _matrix4 =
        Tween<Matrix4>(begin: Matrix4.skewX(0.0), end: Matrix4.skewX(-0.4))
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            builder: (context, child) {
              return Transform(
                transform: Matrix4.skewX(_skewX.value),
                // Comment line 43 and Uncomment line 45 to Change complete Matrix4
                // transform: _matrix4.value,
                child: child,
              );
            },
            animation: _controller,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                ),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () {
                  setState(() => _width = 400);
                  _controller.reverse();
                },
                child: const Text('Rectangle'),
              ),
              FilledButton(
                onPressed: () {
                  setState(() => _width = 200);
                  _controller.reverse();
                },
                child: const Text('Square'),
              ),
              FilledButton(
                onPressed: () => _controller.forward(),
                child: const Text('Rhombus'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
