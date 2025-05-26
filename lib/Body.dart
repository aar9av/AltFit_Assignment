import 'package:flutter/material.dart';

import 'HomeTab.dart';
import 'FitnessTab.dart';
import 'CalendarTab.dart';

Widget body(BuildContext context, int pageIndex, dynamic bodyData) {
  Widget content;

  switch (pageIndex) {
    case 0:
      content = Home(homeData: bodyData['home']);
      break;
    case 1:
      content = fitness(context, bodyData['fitness']);
      break;
    case 2:
      content = calendar(context, bodyData['calendar']);
      break;
    default:
      content = calendar(context, bodyData['calendar']);
  }

  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Theme.of(context).colorScheme.background,
    child: content,
  );
}
