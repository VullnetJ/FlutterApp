import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon.dart';
import '../components/reusable.dart';
import '../constants.dart';
import 'screen1.dart';
import '../calculation.dart';
import '../components/button.dart';

enum Gender {
  male,
  female,
  selected,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  dynamic selected;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableC(
                    onP: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    colour: selected == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(icon: Icons.male, label: 'Male'),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       selected = Gender.male;
                  //       // updateColor(Gender.male);
                  //     });
                  //   },
                  //     child: ReusableC(
                  //     colour: selected ==Gender.male ? activeCardColor : inactiveCardColor,
                  //     cardChild: IconContent(icon: Icons.male, label: 'Male'),
                  //   ),
                  // ),
                ),
                Expanded(
                  child: ReusableC(
                    onP: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    colour: selected == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(icon: Icons.female, label: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableC(
              onP: () {
                setState(() {});
              },
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height', // height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pink[600],
                      inactiveTickMarkColor: Colors.grey,
                      overlayColor: Colors.green,
                      activeTickMarkColor: Colors.blue[400],
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                      trackHeight: 5.0,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 210.0,

                      // activeColor: Colors.purple,

                      label: '$height',
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableC(
                    onP: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight in KG',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                }),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableC(
                    onP: () {
                      setState(() {});
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          ButtonBottom(
            buttonTitle: 'Calculate BMI',
            onTap: () {
              Calculation calculate =
              //bmi must not be here and not have a value
                  Calculation(height: height, weight: weight, bmi: 20);
              //  calulate.getResult();
              //  calulate.getInterpretation();

              // Navigator.pushNamed(context, '/ScreenOne');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenOne(
                    bmiResult: calculate.calculateBMI(20),
                    // calcuateBMI must only be called without any values. s
                    resultText: calculate.getResult(),
                    interpreation: calculate.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// // FloatingActionButton(
//   backgroundColor: Color(0xFF4C4),
//   child: Icon(Icons.add, color: Colors.white),
//   onPressed: () {},
// ),
