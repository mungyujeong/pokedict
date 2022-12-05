import 'package:flutter/material.dart';

class customCard extends StatelessWidget {
  final String name, amount, currency;
  final IconData icon;
  final bool isInverted;
  final int heightOffset;

  final Color _blackColor = const Color.fromARGB(255, 44, 47, 51);

  const customCard({
    super.key,
    required this.name,
    required this.amount,
    required this.currency,
    required this.icon,
    required this.isInverted,
    required this.heightOffset,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.translate(
      offset: Offset(0, -20 * (heightOffset - 1)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? _blackColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: isInverted ? Colors.white : _blackColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: isInverted
                              ? Colors.white.withOpacity(0.8)
                              : _blackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        currency,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: isInverted
                              ? Colors.white.withOpacity(0.8)
                              : _blackColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(6, 12),
                  child: Icon(
                    icon,
                    color: isInverted ? Colors.white : _blackColor,
                    size: 90,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
