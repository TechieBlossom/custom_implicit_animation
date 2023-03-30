import 'package:custom_implicit_animation/sizes.dart';
import 'package:custom_implicit_animation/widgets/ap.dart';
import 'package:flutter/material.dart';

class DotsScreen extends StatefulWidget {
  const DotsScreen({super.key});

  @override
  State<DotsScreen> createState() => _DotsScreenState();
}

class _DotsScreenState extends State<DotsScreen> {
  late List<Offset> _currentOffsets;

  @override
  void initState() {
    super.initState();
    _currentOffsets = _squareOffsets();
  }

  List<Offset> _squareOffsets() => [
        // Top line
        for (int i = 0; i <= 15; i++) Offset(i * Sizes.dotSize, 0),

        // Bottom line
        for (int i = 0; i <= 15; i++)
          Offset(
            i * Sizes.dotSize,
            15 * Sizes.dotSize,
          ),

        // Left line
        for (int i = 0; i <= 15; i++) Offset(0, i * Sizes.dotSize),

        // Right line
        for (int i = 0; i <= 15; i++)
          Offset(
            15 * Sizes.dotSize,
            i * Sizes.dotSize,
          ),
      ];

  List<Offset> _rectangleOffsets() => [
        // Top line
        for (int i = 0; i <= 20; i++) Offset(i * Sizes.dotSize, 0),

        // Bottom line
        for (int i = 0; i <= 20; i++)
          Offset(
            i * Sizes.dotSize,
            10 * Sizes.dotSize,
          ),

        // Left line
        for (int i = 0; i <= 10; i++) Offset(0, i * Sizes.dotSize),

        // Right line
        for (int i = 0; i <= 10; i++)
          Offset(
            20 * Sizes.dotSize,
            i * Sizes.dotSize,
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shapes with Dots'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 280,
            height: 280,
            child: Stack(
              children:
                  _currentOffsets.map((offset) => AP(offset: offset)).toList(),
            ),
          ),
          Row(
            children: [
              FilledButton(
                onPressed: () => setState(
                  () => _currentOffsets = _rectangleOffsets(),
                ),
                child: const Text('Rectangle'),
              ),
              FilledButton(
                onPressed: () => setState(
                  () => _currentOffsets = _squareOffsets(),
                ),
                child: const Text('Square'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
