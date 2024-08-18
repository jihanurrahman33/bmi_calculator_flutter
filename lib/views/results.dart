import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_widgets/homescreen_custom_widgets/reuseablecard.dart';
import 'package:bmi_calculator/custom_widgets/reuseablebutton.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.getResult,
    required this.calculateBmi,
    required this.getInterpretation,
  });
  final String getResult;
  final String calculateBmi;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text(
          'BMI Calculator',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            child: Text(
              'Your Results',
              style: kNumberStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResult,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 170, 6), fontSize: 30),
                  ),
                  Text(
                    calculateBmi,
                    style: kNumberStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    getInterpretation,
                    style: kLabelTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              color: kActiveColor,
            ),
          ),
          Expanded(
            child: Reuseablebutton(
                buttonName: 'Re-Calculate',
                route: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
