import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ErrorPage.dart';
import 'HomePage.dart';

ValueNotifier<bool> modeNotifier = ValueNotifier(true);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  dynamic data = await getDataFromFirestore();
  runApp(AltFitAssignment(data: data));
}

Future<dynamic> getDataFromFirestore() async {
  try {
    final docSnapshot = await FirebaseFirestore.instance.collection('Data').doc('data').get();
    if (docSnapshot.exists) {
      dynamic data = docSnapshot.data();
      return data;
    } else {
      return "error";
    }
  } catch (e) {
    return "error";
  }
}

class AltFitAssignment extends StatelessWidget {
  final dynamic data;

  const AltFitAssignment({super.key, required this.data});

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
          home: data == "error" ? const ErrorPage() :
          HomePage(
            title: data['title'],
            bodyData: data['body'],
          ),
        );
      },
    );
  }
}
