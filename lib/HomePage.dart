import 'package:flutter/material.dart';

import 'AppBar.dart';
import 'Body.dart';
import 'BottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.bodyData});
  final String title;
  final dynamic bodyData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, widget.title),
      body: body(context, _currentIndex, widget.bodyData),
      bottomNavigationBar: bottomNavigationBar(
        context,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
