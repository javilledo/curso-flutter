import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'package:fl_components/models/models.dart';

class AppRoutes {

  static const initialRoute = 'home';

  static final List<MenuOption> menuOptions = [
    //TODO: Quitar home
    // MenuOption(route: 'home', icon: Icons.home_max_sharp, name: 'Home Screen', screen: const HomeScreen()),
    MenuOption(route: 'listview1', icon: Icons.list_alt, name: 'ListView 1', screen: const ListView1Screen()),
    MenuOption(route: 'listview2', icon: Icons.list, name: 'ListView 2', screen: const ListView2Screen()),
    MenuOption(route: 'alert', icon: Icons.add_alert_outlined, name: 'Alertas - Alerts', screen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.credit_card, name: 'Tarjetas - Cards', screen: const CardScreen()),
    MenuOption(route: 'avatar', icon: Icons.supervised_user_circle_outlined, name: 'Circle Avatar', screen: const AvatarScreen()),
    MenuOption(route: 'animated', icon: Icons.play_circle_outline, name: 'Animated Container', screen: const AnimatedScreen()),
    MenuOption(route: 'inputs', icon: Icons.input_rounded, name: 'Text Inputs', screen: const InputsScreen()),

  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = <String, Widget Function(BuildContext)>{}; 
      appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
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
