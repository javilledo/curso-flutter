import 'package:flutter/material.dart';

import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Es para asegurar que se cargan todos los widgets antes
  await PushNotificationsService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

@override
  void initState() {
    super.initState();
    PushNotificationsService.messagesStream.listen((message) {

      // print('MyApp: $message');

      navigatorKey.currentState?.pushNamed('message', arguments: message);

      final SnackBar snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);

     });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, // Navegar
      scaffoldMessengerKey: messengerKey, // Snacks
      routes: {
        'home':    (context) => const HomeScreen(),
        'message': (context) => const MessageScreen(),
      },
    );
  }
}