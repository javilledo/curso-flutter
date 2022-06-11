import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider and Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive( //El adaptive es para adaptarlo a cada plataforma (iOS, Android)
            value: _sliderValue, 
            min: 50,
            max: 400,
            activeColor: AppTheme.primaryColor,
            // divisions: 10,
            onChanged: _sliderEnabled
            ? (value) {
              _sliderValue = value;
              setState(() {});
            }
            : null,
          ),

          Checkbox(
            value: _sliderEnabled, 
            onChanged: (value){
              _sliderEnabled = value ?? true;
              setState(() {});
            }),
            
          CheckboxListTile(
            title: const Text('Habilitar slider'),
            activeColor: AppTheme.primaryColor,
            value: _sliderEnabled, 
            onChanged: (value) => setState(() => _sliderEnabled = value ?? true)),
          
          Switch(
            value: _sliderEnabled, 
            onChanged: (value) => setState(() => _sliderEnabled = value)),

          SwitchListTile.adaptive(
            title: const Text('Habilitar slider'),
            activeColor: AppTheme.primaryColor,
            value: _sliderEnabled, 
            onChanged: (value) => setState(() => _sliderEnabled = value)),

          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://previews.123rf.com/images/marrishuanna/marrishuanna1502/marrishuanna150200082/36936179-emblema-marino-con-un-barco-en-un-c%C3%ADrculo-en-el-folleto-verticales-alargada.jpg'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),

      
        ],
      ),
    );
  }
}