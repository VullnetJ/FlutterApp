import 'dart:math';

class Calculation {

  //bmi must not be included in required this.bmi. 
  Calculation({required this.height, required this.weight, required this.bmi});

  final int height;
  final int weight;
  double bmi;
  
  String calculateBMI(double bmi) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (bmi > 25) {
      return 'OverWeight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'The body weight is higer than normal. Try to exercise more often';
    } else if (bmi >= 18.5) {
      return 'Good job!, Your body weight is normal';
    } else {
      return 'You have to eat more. Your body weight is lower than normal';
    }
  }
}
