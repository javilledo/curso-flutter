import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'package:fl_components/models/models.dart';

class AppRoutes {

  static const initialRoute = 'home';

  static final List<MenuOption> menuOptions = [
    //TODO: Quitar home
    MenuOption(route: 'home', icon: Icons.abc, name: 'Home Screen', screen: const HomeScreen()),
    MenuOption(route: 'listview1', icon: Icons.abc, name: 'ListView 1', screen: const ListView1Screen()),
    MenuOption(route: 'listview2', icon: Icons.abc, name: 'ListView 2', screen: const ListView2Screen()),
    MenuOption(route: 'alert', icon: Icons.abc, name: 'Alertas - Alerts', screen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.abc, name: 'Tarjetas - Cards', screen: const CardScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = <String, Widget Function(BuildContext)>{}; 
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    // menuOptions.map((e){
    //   appRoutes.addAll({e.route: (BuildContext context) => e.screen});
    // });
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes() {
  //   return {
  //     'home': (context) => const HomeScreen(),
  //     'listview1': (context) => const ListView1Screen(),
  //     'listview2': (context) => const ListView2Screen(),
  //     'alert': (context) => const AlertScreen(),
  //     'card': (context) => const CardScreen()
  //   };
  // }

  static Route<MaterialPageRoute> onGeneratedRoute(settings) {
    return MaterialPageRoute(builder: (context) => const ListView1Screen());
  }
}
