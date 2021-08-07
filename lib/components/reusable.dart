import 'package:flutter/material.dart';

class ReusableC extends StatelessWidget {
  ReusableC({required this.colour, required this.cardChild, required this.onP});

  final Color colour;
  final Widget cardChild;
  final Function()? onP;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onP,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.1),
        ),
      ),
    );
  }
}
