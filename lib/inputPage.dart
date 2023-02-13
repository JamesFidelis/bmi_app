import 'package:bmi_app/ResultPage.dart';
import 'package:bmi_app/calculator_Brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconCard.dart';
import 'ReusableCard.dart';
import 'constants.dart';

enum Gender { Male, Female, None }

enum Calculator { WeidghtAdd, WeidghtMinus, AgeAdd, AgeMinus }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.None;
  int heights = 180;
  int weights = 60;
  int age = 12;

  void Calculate(Calculator calculator) {
    setState(() {
      switch (calculator) {
        case Calculator.AgeMinus:
          {
            if ((age > 0)) {
              age--;
            }
          }
          break;

        case Calculator.AgeAdd:
          {
            if (age < 150) {
              age++;
            }
          }
          break;

        case Calculator.WeidghtAdd:
          {
            if (weights < 150) {
              weights++;
            }
          }
          break;

        case Calculator.WeidghtMinus:
          {
            if (weights > 0) {
              weights--;
            }
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.Male
                        ? activeCard
                        : inactiveCard,
                    childWidget: const IconCard(
                      myIcons: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedGender == Gender.Female
                          ? activeCard
                          : inactiveCard,
                      childWidget: const IconCard(
                        myIcons: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      )),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
                colour: activeCard,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$heights',
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kUnitTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pinkAccent,
                        overlayColor: const Color(0x465C0322),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 10.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 18.0),
                        inactiveTrackColor: Colors.grey,
                      ),
                      child: Slider(
                        value: heights.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double value) {
                          setState(() {
                            heights = value.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    colour: activeCard,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weights',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                Calculate(Calculator.WeidghtMinus);
                              },
                              elevation: 0.0,
                              constraints: const BoxConstraints.tightFor(
                                  width: 56.0, height: 56.0),
                              shape: const CircleBorder(),
                              fillColor: Colors.blueGrey,
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Calculate(Calculator.WeidghtAdd);
                              },
                              elevation: 0.0,
                              constraints: const BoxConstraints.tightFor(
                                  width: 56.0, height: 56.0),
                              shape: const CircleBorder(),
                              fillColor: Colors.blueGrey,
                              child: const Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: ReusableCard(
                    colour: activeCard,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                Calculate(Calculator.AgeMinus);
                              },
                              elevation: 0.0,
                              constraints: const BoxConstraints.tightFor(
                                  width: 56.0, height: 56.0),
                              shape: CircleBorder(),
                              fillColor: Colors.blueGrey,
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                Calculate(Calculator.AgeAdd);
                              },
                              elevation: 0.0,
                              constraints: const BoxConstraints.tightFor(
                                  width: 56.0, height: 56.0),
                              shape: const CircleBorder(),
                              fillColor: Colors.blueGrey,
                              child: const Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
          Container(
            width: double.infinity,
            height: 70.0,
            margin: const EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.redAccent,
            ),
            child: TextButton(
              child: Text('Calculate', style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weights, height: heights);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                              bmiResults: calc.bmiResult(),
                              bmiStatus_: calc.bmiStatus(),
                              bmiInterpretations: calc.bmiInterpretation())));
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
