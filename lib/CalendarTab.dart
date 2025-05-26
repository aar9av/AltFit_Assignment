import 'package:flutter/material.dart';

Widget calendar(BuildContext context, dynamic calendarData) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          calendarData['title'],
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          calendarData['subtitle'],
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
