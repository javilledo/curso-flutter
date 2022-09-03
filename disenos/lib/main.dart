import 'package:disenos/screens/basic_design.dart';
import 'package:disenos/screens/home_screen.dart';
import 'package:disenos/screens/scroll_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Pone en blanco la status bar superior. Con dark se pondría en negro.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); // Con copywith se pueden modificar características

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      theme: ThemeData.dark(),
      routes: {
        'basic_design': (BuildContext context) => const BasicDesignScreen(), 
        'scroll_screen': (BuildContext context) => const ScrollScreen(), 
        'home_screen': (BuildContext context) => const HomeScreen(), 
      },
      );
  }
}


