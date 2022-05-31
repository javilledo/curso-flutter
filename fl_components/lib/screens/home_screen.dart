import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          leading: Icon(AppRoutes.menuOptions[i].icon),
          title: Text(AppRoutes.menuOptions[i].name),
          onTap: () {
            // final route = MaterialPageRoute(
            //   builder: (context) => const ListView1Screen()
            // );
            // Navigator.push(context, route);
            Navigator.pushNamed(context, AppRoutes.menuOptions[i].route);
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: AppRoutes.menuOptions.length
      )
    );
  }
}
