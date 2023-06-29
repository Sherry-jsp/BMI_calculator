import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 50.0;
const activeBoxColor = Color(0xFF1D1E33);
const inactiveBoxColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender{male, female}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveBoxColor;
  Color femaleCardColor = inactiveBoxColor;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == inactiveBoxColor) {
        maleCardColor = activeBoxColor;
        femaleCardColor =inactiveBoxColor;
      } else {
        maleCardColor = inactiveBoxColor;
      }
    }
    if(selectedGender == Gender.female){
      if(femaleCardColor == inactiveBoxColor){
        femaleCardColor = activeBoxColor;
        maleCardColor = inactiveBoxColor;
      }else{
        femaleCardColor = inactiveBoxColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(onTap: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                      child: ReusableCard(
                        colour: femaleCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(colour: activeBoxColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(colour: activeBoxColor),
                  ),
                  Expanded(
                    child: ReusableCard(colour: activeBoxColor),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}
