
import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape(){
    final random = Random();
    _width = random.nextInt(MediaQuery.of(context).size.width.toInt() - 50).toDouble();
    _height = random.nextInt(MediaQuery.of(context).size.height.toInt() - 50).toDouble();
    _color = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10); // El +10 es para evitar que pueda ser 0
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          //Cuidado: No puede ponerse a la vez Color en el Container y decoration
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow_outlined, size: 35,),
        onPressed: () => changeShape(),
      ),
    );
  }
}
