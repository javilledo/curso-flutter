import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    const boxDecoration = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.5,0.5
            ],
            colors: [
              Color(0xff5EE8C5), 
              Color(0xff30BAD6)
            ])
        );

    return Scaffold(
      // backgroundColor: Color(0xff30BAD6),
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: const [
            Page1(),
            Page2()
          ],
        ),
      )
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        //Background Image
        Background(),
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);

    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,), 
          const Text('11º', style: textStyle),
          const Text('Miércoles', style: textStyle),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white,)
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/scroll-1.png')))
      ;
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff0098FA),
            shape: StadiumBorder()
          ),
          onPressed: (){}, 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 20),),
          )),
      ),
    );
  }
}