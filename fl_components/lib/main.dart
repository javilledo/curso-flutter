import 'package:flutter/material.dart';

import 'package:fl_components/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'listview1' : (context) => const ListView1Screen(),
        'listview2' : (context) => const ListView2Screen(),
        'alert'     : (context) => const AlertScreen(),
        'card'      : (context) => const CardScreen()
      },
      onGenerateRoute: (settings){ //Only executed if route name in Navigator.pushNamed doesn't exist
        return MaterialPageRoute(builder: (context) => const ListView1Screen());
      },
    );
  }
}
