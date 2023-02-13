import 'package:bmi_app/ResultPage.dart';
import 'package:flutter/material.dart';
import 'inputPage.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Colors.blueGrey),
          scaffoldBackgroundColor: kBackgroundColor),
      home: InputPage(),
      routes: {
        // '/result': (context) => ResultsPage(),
        '/homes': (context) => InputPage(),
      },
    );
  }
}
