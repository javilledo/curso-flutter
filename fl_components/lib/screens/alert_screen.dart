import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogiOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(
              height: 10,
            ),
            FlutterLogo(
              size: 100,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok')),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.red,)))
        ],
      )
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        title: const Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(
              height: 10,
            ),
            FlutterLogo(
              size: 100,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok')),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.red,)))
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            //  style: ElevatedButton.styleFrom(
            //    primary: AppTheme.primaryColor,
            //    shape: const StadiumBorder(),
            //    elevation: 0
            //  ),
            onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogiOS(context),
            // Cuidado que el Platform a usar es el dart.io, no el de html.io
                // displayDialogAndroid(context), // Si es null, el botón se deshabilita
                // displayDialogiOS(context), // Si es null, el botón se deshabilita
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Mostrar alerta',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.close),
      ),
    );
  }
}
