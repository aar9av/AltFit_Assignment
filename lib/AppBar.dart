import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

PreferredSizeWidget appBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onBackground,
    surfaceTintColor: Colors.transparent,
    elevation: 4,
    shadowColor: Theme.of(context).colorScheme.error,
    titleSpacing: 5,
    leading: Padding(
      padding: const EdgeInsets.only(
        left: kToolbarHeight * 0.25,
        top: kToolbarHeight * 0.25,
        bottom: kToolbarHeight * 0.25,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: kToolbarHeight * 0.3,
          ),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(
          modeNotifier.value ? Icons.dark_mode : Icons.light_mode,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () {
          modeNotifier.value = !modeNotifier.value;
        },
      ),
    ],
  );
}
