import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Avatars'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('SL'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
           // Un FadeImage no se puede poner en el CircleAvatar.
           maxRadius: 150,
           backgroundImage: NetworkImage('https://www.elsoldeacapulco.com.mx/incoming/wpgvi0-villanos-creados-por-stan-lee.jpg/ALTERNATES/LANDSCAPE_1140/Villanos%20creados%20por%20Stan%20lee.jpg'),
         ),
      ),
    );
  }
}