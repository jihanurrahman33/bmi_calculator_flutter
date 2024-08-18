import 'package:flutter/material.dart';

class Roundiconbutton extends StatelessWidget {
  const Roundiconbutton({super.key, required this.icon, required this.onpress});
  final IconData icon;
  final void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      child: Icon(icon),
    );
  }
}
