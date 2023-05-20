import 'package:flutter/material.dart';

class PokeButton extends StatelessWidget {
  const PokeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 15,
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.star_border_outlined,
            ),
            iconSize: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.circle_outlined,
            ),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
