import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          title: const Text('CounterScreen'),
          elevation: 0,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Número de clicks:', style: fontSize30),
            Text('$counter', style: fontSize30),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatingActions(
          increaseFn: increase,
          decreaseFn: decrease,
          resetFn: reset,
        ));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions(
      {Key? key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () => decreaseFn(),
              child: const Icon(Icons.exposure_minus_1_outlined),
            ),

            // const SizedBox(
            //   width: 5,
            // ),

            FloatingActionButton(
              onPressed: () => resetFn(),
              child: const Icon(Icons.exposure_outlined),
            ),

            // const SizedBox(
            //   width: 5,
            // ),

            FloatingActionButton(
                onPressed: () => increaseFn(), 
                child: const Icon(Icons.exposure_plus_1_outlined)),
          ],
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
