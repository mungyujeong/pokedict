import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? typeName;
  final Color? typeColor;
  final String? frontDefaultSprite;
  final String? pokemonColor;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.typeName,
    required this.typeColor,
    required this.frontDefaultSprite,
    required this.pokemonColor,
  }) : super(key: key);

  Future<Color> updatePaletteGenerator(String? frontDefaultSprite) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(frontDefaultSprite!).image,
    );
    return paletteGenerator.dominantColor!.color;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: IntrinsicHeight(
        child: FutureBuilder(
          future: updatePaletteGenerator(frontDefaultSprite),
          builder: (context, AsyncSnapshot<Color> snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  color: snapshot.data!.withOpacity(.8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                PokeInfo(
                                  id: id,
                                  name: name,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const PokeButton(),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TypeContainer(
                                      typeName: typeName!.toUpperCase(),
                                      typeColor: typeColor,
                                      typeIcon: Icons.electric_bolt,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const TypeContainer(
                                      typeName: 'GHOST',
                                      typeColor: Colors.deepPurple,
                                      typeIcon: Icons.cut_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                            ),
                          ),
                          child: Row(
                            children: [
                              Transform.translate(
                                  offset: const Offset(10, 0),
                                  child: Image.network(
                                    frontDefaultSprite!,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Text("");
            }
          },
        ),
      ),
    );
  }
}

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

class PokeInfo extends StatelessWidget {
  final int? id;
  final String? name;
  const PokeInfo({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        child: Row(
          children: [
            Text(
              "#${id.toString().padLeft(3, '0')}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.8),
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeContainer extends StatelessWidget {
  final String? typeName;
  final IconData? typeIcon;
  final Color? typeColor;
  const TypeContainer({
    Key? key,
    required this.typeName,
    required this.typeIcon,
    required this.typeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: typeColor!,
          ),
          color: typeColor!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              typeIcon,
              color: typeColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                typeName!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
