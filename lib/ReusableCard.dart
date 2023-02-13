import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childWidget;
  const ReusableCard({required this.colour, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: colour,
        ),
        child: childWidget);
  }
}
