import 'package:flutter/material.dart';
import 'screens/input.dart';
import 'screens/screen1.dart';

void main() => runApp(Bmi());

class Bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        //home: InputPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
          '/ScreenOne': (context) => ScreenOne(
                bmiResult: '',
                resultText: '',
                interpreation: '',
              ),
        });
  }
}
