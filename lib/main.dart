import 'package:flutter/material.dart';

import 'Data.dart';
import 'HomePage.dart';

ValueNotifier<bool> modeNotifier = ValueNotifier(true);

void main() {
  dynamic data = Data.data;
  runApp(AltFitAssignment(data: data));
}

class AltFitAssignment extends StatelessWidget {
  final dynamic data;

  AltFitAssignment({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: modeNotifier,
      builder: (context, isLightMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme(
              brightness: isLightMode ? Brightness.light : Brightness.dark,
              primary: Colors.blue,
              onPrimary: isLightMode ? Colors.grey.shade600 : Colors.grey.shade400,
              secondary: isLightMode ? Colors.black : Colors.white,
              onSecondary: Colors.grey,
              surface: Colors.blue.shade100,
              onSurface: Colors.blue.shade600,
              background: isLightMode ? Colors.blueGrey.shade100 : Colors.grey.shade800,
              onBackground: isLightMode ? Colors.white : Colors.grey.shade900,
              error: Colors.black,
              onError: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: HomePage(
            title: data['title'],
            bodyData: data['body'],
          ),
        );
      },
    );
  }
}
