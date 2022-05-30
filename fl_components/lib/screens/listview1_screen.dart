import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);
  final List<String> options = const [
    'Megaman',
    'Metal Gear',
    'Superman',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ListView Tipo 1')),
        body: ListView(
          children: options.map((e) => ListTile(
            title: Text(e),
            trailing: const Icon(Icons.keyboard_arrow_right),
            )
          ).toList(),
          
        ));
  }
}
