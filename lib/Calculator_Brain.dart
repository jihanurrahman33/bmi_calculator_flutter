import 'dart:math';

class CalculatorBrain {
  // Constructor to initialize height and weight
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double? _bmi; // Nullable double to store BMI value

  // Method to calculate BMI
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2); // Calculate BMI
    return _bmi!
        .toStringAsFixed(1); // Return BMI as a string with 1 decimal place
  }

  // Method to get BMI classification result
  String getResult() {
    if (_bmi == null) {
      calculateBmi(); // Ensure BMI is calculated before using it
    }

    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // Method to get detailed interpretation of the BMI
  String getInterpretation() {
    if (_bmi == null) {
      calculateBmi(); // Ensure BMI is calculated before using it
    }

    if (_bmi! >= 25) {
      return 'Overweight: Your BMI is 25 or above, which classifies you as overweight. This means you have a higher body weight than is considered healthy for your height.';
    } else if (_bmi! >= 18.5) {
      return 'Normal: Your BMI is between 18.5 and 24.9, which falls within the normal weight range. This is considered a healthy weight for your height.';
    } else {
      return 'Underweight: Your BMI is below 18.5, which classifies you as underweight. This suggests that you have a lower body weight than what is considered healthy for your height.';
    }
  }
}
