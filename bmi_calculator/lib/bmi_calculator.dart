import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;
  double _bmi;

  BMICalculator(this.height, this.weight);

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "Overweight";
    } else if (_bmi > 15) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return "You have a higher than normal weight. Try to reduce some weight.";
    } else if (_bmi > 15) {
      return "You are perfect. Continue the good work";
    } else {
      return "You are underweight. Eat more";
    }
  }
}
