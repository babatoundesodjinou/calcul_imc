import 'package:calcul_imc/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Color color;
  final void Function()? onPress;
  const ReusableCard({
    super.key, required this.cardChild, this.color = kActiveCardColour, this.onPress  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: kActiveCardColour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
