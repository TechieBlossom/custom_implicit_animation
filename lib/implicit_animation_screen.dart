import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  double _width = 200;
  final _height = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => setState(() => _width = 400),
                child: const Text('Rectangle'),
              ),
              FilledButton(
                onPressed: () => setState(() => _width = 200),
                child: const Text('Square'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
