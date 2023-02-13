import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData myIcons;
  final String gender;
  const IconCard({required this.myIcons, required this.gender});

  Text customText() {
    return Text(
      gender,
      style: const TextStyle(color: Colors.white, fontSize: 18.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcons,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        customText(),
      ],
    );
  }
}
