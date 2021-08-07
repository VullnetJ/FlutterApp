import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonBottom extends StatelessWidget {
  ButtonBottom({required this.onTap, required this.buttonTitle});
  final Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 1,
      shape: CircleBorder(),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4),
      constraints: BoxConstraints.tightFor(
        width: 60,
        height: 60,
      ),
    );
  }
}
