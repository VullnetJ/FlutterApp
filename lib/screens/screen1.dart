import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable.dart';
import '../components/button.dart';

class ScreenOne extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpreation;
  ScreenOne(
      {required this.bmiResult,
      required this.resultText,
      required this.interpreation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Results"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ReusableC(
                onP: () {},
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kresultTextStyle,
                    ),
                    Text(
                      bmiResult.toUpperCase(),
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpreation.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            ButtonBottom(
              buttonTitle: 'Calculate Again',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

 // child: ElevatedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('Go to first page!'),
        // ),