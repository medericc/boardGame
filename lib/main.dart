import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(JustOneApp());
}

class JustOneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juste Un',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
