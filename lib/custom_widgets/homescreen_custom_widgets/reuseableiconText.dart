import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class Reuseableicontext extends StatelessWidget {
  const Reuseableicontext(
      {super.key, required this.icon, required this.iconText});
  final IconData icon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
