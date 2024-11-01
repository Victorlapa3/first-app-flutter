import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int dificultyLevel;

  const Difficulty({
    required this.dificultyLevel,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 15,
          color: (index < dificultyLevel)
              ? Colors.blue
              : Colors.blue[100],
        );
      }),
    );
  }
}