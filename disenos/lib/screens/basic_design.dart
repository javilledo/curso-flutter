import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [

          // Imagen
          const Image(image: AssetImage('assets/landscape.jpeg')),

          // Título
          const Title(),

          // Button Section
          const ButtonSection(),

          // Description
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('Non ea adipisicing velit Lorem eiusmod proident esse consequat voluptate laborum velit quis. Deserunt exercitation eiusmod tempor proident. Officia est sint ipsum fugiat. Excepteur aliqua anim do consectetur duis exercitation dolore labore eu laborum labore cupidatat. Laborum ullamco laboris do nostrud fugiat cillum qui excepteur do ullamco elit. Fugiat ea exercitation mollit fugiat magna quis Lorem amet. Pariatur cillum minim consequat cillum reprehenderit incididunt occaecat laboris deserunt nisi nostrud enim irure.'))

        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.black38),)
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(icon: Icons.phone, text: 'CALL',),
          CustomButton(icon: Icons.map, text: 'ROUTE',),
          CustomButton(icon: Icons.share, text: 'SHARE',),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.icon, required this.text,}) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30,),
        Text(text, style: const TextStyle(color: Colors.blue),)
      ],
    );
  }
}
