import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
              leading: Icon(
                Icons.picture_as_pdf,
                color: AppTheme.primaryColor,
              ),
              title: Text('Soy un título'),
              subtitle: Text(
                  'Enim aliqua minim in et voluptate laboris labore aute eiusmod. Adipisicing ex non incididunt nulla eiusmod sit proident consequat minim ad. Amet excepteur sint est quis cillum occaecat. Quis nisi non aliqua ad officia ut labore incididunt veniam aute dolor qui.')
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){},
                  style: Theme.of(context).textButtonTheme.style, 
                  child: const Text('OK'),  
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Cancelar')),

              ],
            ),
          )
        ],
      ),
    );
  }
}
