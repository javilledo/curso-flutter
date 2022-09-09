import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: uiProvider.selectedMenuOpt,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map), 
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration), 
          label: 'Direcciones'
        ),
    ]);
  }
}
