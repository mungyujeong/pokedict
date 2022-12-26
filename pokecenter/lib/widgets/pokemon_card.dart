import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "#1010",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        "PokemonName",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star_border_outlined,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.circle_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      TypeContainer(
                        typeName: 'FIGHTING',
                      ),
                      TypeContainer(
                        typeName: 'GHOST',
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Transform.translate(
                  offset: const Offset(10, 0),
                  child: const Icon(
                    Icons.catching_pokemon_outlined,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
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
