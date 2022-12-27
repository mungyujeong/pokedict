import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(1.2, 0),
              child: Transform.translate(
                offset: const Offset(-20, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                  child: const Icon(
                    Icons.catching_pokemon_outlined,
                    size: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeContainer extends StatelessWidget {
  final String typeName;
  const TypeContainer({
    Key? key,
    required this.typeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 8,
        ),
        child: Text(
          typeName,
        ),
      ),
    );
  }
}
