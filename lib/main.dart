import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gender selection
          Expanded(
            child: Row(
              children: [
                buildGenderCard(Gender.male, Icons.male, 'MALE'),
                buildGenderCard(Gender.female, Icons.female, 'FEMALE'),
              ],
            ),
          ),
          // Height slider
          Expanded(
            child: CardContainer(
              color: Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                      Text(' cm', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.pink,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Weight and Age controls
          Expanded(
            child: Row(
              children: [
                buildCounterCard('WEIGHT', weight, (val) => setState(() => weight = val)),
                buildCounterCard('AGE', age, (val) => setState(() => age = val)),
              ],
            ),
          ),
          // Calculate button
          GestureDetector(
            onTap: () {
              // Action pour le calcul
            },
            child: Container(
              color: Colors.pink,
              height: 70,
              width: double.infinity,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildGenderCard(Gender gender, IconData icon, String label) {
    final isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: CardContainer(
          color: isSelected ? Color(0xFF1D1E33) : Color(0xFF111328),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80),
              SizedBox(height: 10),
              Text(label, style: TextStyle(fontSize: 18, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildCounterCard(String label, int value, ValueChanged<int> onChange) {
    return Expanded(
      child: CardContainer(
        color: Color(0xFF1D1E33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(color: Colors.grey)),
            Text('$value', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(icon: Icons.remove, onPressed: () => onChange(value - 1)),
                SizedBox(width: 10),
                RoundIconButton(icon: Icons.add, onPressed: () => onChange(value + 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const CardContainer({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 46, height: 46),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
