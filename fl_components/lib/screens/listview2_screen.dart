import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);
  final List<String> options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Tipo 2'),
          // elevation: 0,
          // backgroundColor: Colors.indigo,
          ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              // color: Colors.indigo,
              ),
            onTap: () {
              // final game = options[index];
              // print(game);
            },
          ),
          separatorBuilder: (context, index) => const Divider(),
        ));
  }
}
