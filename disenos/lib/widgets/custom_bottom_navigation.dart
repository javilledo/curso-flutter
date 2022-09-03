import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink, 
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: 0,
      items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined), label: 'Calendario'),
      BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline_outlined), label: 'Gráfica'),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined), label: 'Usuarios'),
    ]);
  }
}
