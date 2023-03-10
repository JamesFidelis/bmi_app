import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  CalculatorBrain({required this.weight, required this.height});
  double? _bmi;

  String bmiResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1).toString();
  }

  String bmiStatus() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight.Try to exercise more';
    } else if (_bmi! > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more to increase your weight.';
    }
  }
}
