import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(fontSize: 30);
    int counter = 10;

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          elevation: 10,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Número de clicks:', style: fontSize30),
                Text('$counter', style: fontSize30),
              ]),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter++;
            print('Contador: $counter');
          },
          child: const Icon(Icons.add),
        ));
  }
}
