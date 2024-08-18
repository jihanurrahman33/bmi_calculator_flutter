import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  const Reuseablecard({
    this.cardChild,
    this.onpress,
    required this.color,
    super.key,
  });
  final Color color;
  final Widget? cardChild;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: cardChild,
      ),
    );
  }
}
