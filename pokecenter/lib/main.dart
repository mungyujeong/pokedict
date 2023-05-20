import 'package:flutter/material.dart';
import 'package:pokecenter/screens/dict_screen.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DictScreen(),
    );
  }
}
