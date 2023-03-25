import 'package:flutter/material.dart';

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() =>
      _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _width;
  late Animation<double> _height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _width = Tween<double>(begin: 200, end: 400).animate(_controller);
    _height = Tween<double>(begin: 200, end: 200).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Container(
                width: _width.value,
                height: _height.value,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                  ),
                ),
              );
            },
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
