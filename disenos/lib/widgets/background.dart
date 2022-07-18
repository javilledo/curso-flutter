import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [
            Color(0xff2E305F), 
            Color(0xff202333)
          ]
        )
      );
       
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
      ],
    );
  }
}