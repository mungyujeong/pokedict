import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int startTime = twentyFiveMinutes;
  late Timer timer;
  bool isRunning = true;
  int countPomodoros = 0;

  void onTick(Timer timer) {
    if (startTime == 0) {
      setState(() {
        startTime = twentyFiveMinutes;
        isRunning = false;
        countPomodoros++;
      });
    } else {
      setState(() {
        startTime--;
      });
    }
  }

  void onStartTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = false;
    });
  }

  void onPauseTimer() {
    timer.cancel();
    setState(() {
      isRunning = true;
    });
  }

  void onReset() {
    timer.cancel();
    setState(() {
      startTime = twentyFiveMinutes;
      isRunning = true;
    });
  }

  String format(int seconds) {
    Duration duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(startTime),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 58,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isRunning ? onStartTimer : onPauseTimer,
                    icon: isRunning
                        ? Icon(Icons.play_circle_outline)
                        : Icon(Icons.pause_circle_outline),
                    iconSize: 80,
                    color: Theme.of(context).cardColor,
                  ),
                  IconButton(
                    onPressed: onReset,
                    icon: Icon(Icons.restart_alt_outlined),
                    iconSize: 30,
                    color: Theme.of(context).cardColor,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '$countPomodoros',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontSize: 50,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
