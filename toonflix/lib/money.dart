import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/custom_card.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Jacey',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\$5 150 495',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: 'Transfer',
                      bgColor: Colors.amber,
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const customCard(
                  name: 'Euro',
                  amount: '6 423',
                  currency: 'EUR',
                  icon: Icons.euro_rounded,
                  isInverted: true,
                  heightOffset: 1,
                ),
                const customCard(
                  name: 'Bitcoin',
                  amount: '1 566',
                  currency: 'BIT',
                  icon: Icons.currency_bitcoin,
                  isInverted: false,
                  heightOffset: 2,
                ),
                const customCard(
                  name: 'Dollar',
                  amount: '1 232 482',
                  currency: 'USD',
                  icon: Icons.attach_money_rounded,
                  isInverted: true,
                  heightOffset: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
