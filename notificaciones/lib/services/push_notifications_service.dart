// SHA1: BE:99:EE:CC:E3:10:9E:E3:1F:A2:9E:C5:E0:8E:D8:23:41:63:C0:EB

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream = StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStream.stream;

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    // print('background Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future<void> _onMessageOpenApp(RemoteMessage message) async {
    // print('onMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future initializeApp() async {

    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler); // Cuando la aplicación en segundo plano
    FirebaseMessaging.onMessage.listen(_onMessageHandler); // Cuando la aplicación activa
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp); // Cuando la aplicación cerrada
    // Local notifications

  }

  static closeStreams(){
    _messageStream.close();
  }

}