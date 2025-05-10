import 'package:calcul_imc/constants.dart';
import 'package:calcul_imc/main.dart';
import 'package:calcul_imc/widgets/bottom_button.dart';
import 'package:calcul_imc/widgets/icon_content.dart';
import 'package:calcul_imc/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: kActiveCardColour,
        titleTextStyle: kLargeButtonTextStyle,
        centerTitle: true,
      ),
      // backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        color: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        })),
                Expanded(
                    child:
                        ReusableCard(cardChild: Placeholder(), onPress: () {})),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Placeholder(),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child:
                        ReusableCard(cardChild: Placeholder(), onPress: () {})),
                Expanded(
                    child:
                        ReusableCard(cardChild: Placeholder(), onPress: () {})),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
