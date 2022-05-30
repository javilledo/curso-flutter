import 'package:flutter/material.dart';

import 'package:fl_components/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.access_time_outlined),
          title: const Text('Nombre de ruta'),
          onTap: () {
            // final route = MaterialPageRoute(
            //   builder: (context) => const ListView1Screen()
            // );
            // Navigator.push(context, route);
            Navigator.pushNamed(context, 'listview3');
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10
      )
    );
  }
}
