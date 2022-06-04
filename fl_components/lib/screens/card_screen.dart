import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

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
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(imageUrl: 'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg', name: 'Primera imagen',),
            SizedBox(height: 10),
            CustomCardType2(imageUrl: 'https://www.creativefabrica.com/wp-content/uploads/2021/06/12/mountain-landscape-illustration-design-b-Graphics-13326021-1.jpg'),
            SizedBox(height: 10),
            CustomCardType2(imageUrl: 'https://mymodernmet.com/wp/wp-content/uploads/2022/02/international-landscape-photographer-awards-20.jpeg'),
            SizedBox(height: 100),
          ],
        ));
  }
}

