import 'package:calcul_imc/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTitle;

  const BottomButton({
    super.key, this.onTap, required this.buttonTitle
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle,)),
      
      ),
    );
  }
}
