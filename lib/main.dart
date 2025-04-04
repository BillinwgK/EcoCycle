import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(EcoCycleApp());
}

class EcoCycleApp extends StatelessWidget {
  const EcoCycleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoCycle',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginScreen(),
    );
  }
}
