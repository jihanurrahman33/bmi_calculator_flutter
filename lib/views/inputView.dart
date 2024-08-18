import 'package:bmi_calculator/Calculator_Brain.dart';
import 'package:bmi_calculator/custom_widgets/reuseablebutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../custom_widgets/homescreen_custom_widgets/reuseablecard.dart';
import '../custom_widgets/homescreen_custom_widgets/reuseableiconText.dart';
import '../custom_widgets/roundIconButton.dart';
import '../views/results.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

enum Gender { male, female }

class _BmiCalculatorState extends State<BmiCalculator> {
  int weight = 60;
  int height = 180;
  int age = 18;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveCardColor,
                    cardChild: const Reuseableicontext(
                        icon: FontAwesomeIcons.mars, iconText: 'Male'),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveCardColor,
                    cardChild: const Reuseableicontext(
                        icon: FontAwesomeIcons.venus, iconText: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseablecard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFFEB1555),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: const Color(0xFF111328),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              color: kActiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbutton(
                              onpress: () => setState(() {
                                weight -= 1;
                              }),
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Roundiconbutton(
                              onpress: () => setState(() {
                                weight += 1;
                              }),
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbutton(
                              onpress: () => setState(() {
                                age -= 1;
                              }),
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Roundiconbutton(
                              onpress: () => setState(() {
                                age += 1;
                              }),
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Reuseablebutton(
              route: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Results(
                      getResult: calc.getResult(),
                      calculateBmi: calc.calculateBmi(),
                      getInterpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              buttonName: 'Calculate'),
        ],
      ),
    );
  }
}
