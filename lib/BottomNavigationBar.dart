import 'package:flutter/material.dart';

Widget bottomNavigationBar(
    BuildContext context, {required int currentIndex, required Function(int) onTap,}) {

  List<IconData> icons = [
    Icons.home,
    Icons.fitness_center,
    Icons.calendar_today_rounded,
  ];

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    color: Theme.of(context).colorScheme.onBackground,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(icons.length, (index) {
        final isSelected = currentIndex == index;
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icons[index],
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        );
      }),
    ),
  );
}
