import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: AppTheme.primaryColor,),
                  title: Text('Soy un título'),
                  subtitle: Text('Enim aliqua minim in et voluptate laboris labore aute eiusmod. Adipisicing ex non incididunt nulla eiusmod sit proident consequat minim ad. Amet excepteur sint est quis cillum occaecat. Quis nisi non aliqua ad officia ut labore incididunt veniam aute dolor qui.')
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
