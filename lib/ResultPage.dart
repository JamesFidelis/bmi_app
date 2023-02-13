import 'package:flutter/material.dart';
import 'package:bmi_app/ReusableCard.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String bmiStatus_;
  final String bmiInterpretations;
  const ResultsPage(
      {required this.bmiResults,
      required this.bmiStatus_,
      required this.bmiInterpretations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: activeCard,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiStatus_.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      bmiResults,
                      style: kNumberStyle,
                    ),
                    Text(
                      bmiInterpretations,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          Container(
            width: double.infinity,
            height: 70.0,
            margin: const EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.redAccent,
            ),
            child: TextButton(
              child: const Text(
                'Re-Calculate',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
