import 'package:flutter/material.dart';

Widget fitness(BuildContext context, dynamic fitnessData) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fitnessData['title'],
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          fitnessData['subtitle'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    ),
  );
}
