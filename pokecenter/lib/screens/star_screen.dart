import 'package:flutter/material.dart';
import 'package:pokecenter/component/main_app_bar.dart';

class StarScreen extends StatefulWidget {
  bool isStared;
  bool isCircled;

  StarScreen({
    super.key,
    required this.isStared,
    required this.isCircled,
  });

  @override
  State<StarScreen> createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
        isCircled: widget.isCircled,
        isStared: widget.isStared,
      ),
      body: const Center(
        child: Text("hello"),
      ),
    );
  }
}
