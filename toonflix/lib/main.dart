import 'package:flutter/material.dart';
import 'package:toonflix/screens/web_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main(List<String> args) {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebScreen(),
    );
  }
}
