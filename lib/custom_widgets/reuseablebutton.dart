import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Reuseablebutton extends StatelessWidget {
  const Reuseablebutton(
      {super.key, required this.route, required this.buttonName});
  final void Function()? route;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Container(
        alignment: Alignment.center,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        color: kBottomContainerColor,
        child: Text(
          buttonName,
          style: kNumberStyle,
        ),
      ),
    );
  }
}
