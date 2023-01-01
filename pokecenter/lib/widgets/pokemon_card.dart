import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonCard extends StatelessWidget {
  final int? id;
  final String? name;
  final List<dynamic> type;
  final String? frontDefaultSprite;
  final String? pokemonColor;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.type,
    required this.frontDefaultSprite,
    required this.pokemonColor,
  }) : super(key: key);

  Future<PaletteGenerator?> updatePaletteGenerator(
      String? frontDefaultSprite) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(frontDefaultSprite!).image,
    );
    return paletteGenerator;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: IntrinsicHeight(
        child: FutureBuilder(
          future: updatePaletteGenerator(frontDefaultSprite),
          builder: (context, AsyncSnapshot<PaletteGenerator?> snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  color: snapshot.data!.dominantColor?.color.withOpacity(.8),
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
                                  children: (type.length == 2)
                                      ? [
                                          TypeContainer(
                                            type: type.first.type.name,
                                            typeColor: getTypeColor(
                                                type.first.type.name),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          TypeContainer(
                                            type: type[1].type.name,
                                            typeColor:
                                                getTypeColor(type[1].type.name),
                                          ),
                                        ]
                                      : [
                                          TypeContainer(
                                            type: type.first.type.name,
                                            typeColor: getTypeColor(
                                                type.first.type.name),
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
  final String? type;
  final Color? typeColor;

  const TypeContainer({
    Key? key,
    required this.type,
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
            color: Colors.black.withOpacity(0.8),
          ),
          color: typeColor!.withOpacity(1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/type_icons/$type.svg",
              width: 25,
              color: Colors.white.withOpacity(.5),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                type!.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color? getTypeColor(String? type) {
  switch (type) {
    case 'bug':
      return const Color(0x0092bc2c);
    case 'dark':
      return const Color(0x00595761);
    case 'dragon':
      return const Color(0x000c69c8);
    case 'electric':
      return const Color(0x00f2d94e);
    case 'fire':
      return const Color(0x00fba54c);
    case 'fairy':
      return const Color(0x00ee90e6);
    case 'fighting':
      return const Color(0x00d3425f);
    case 'flying':
      return const Color(0x00a1bbec);
    case 'ghost':
      return const Color(0x005f6dbc);
    case 'grass':
      return const Color(0x005fbd58);
    case 'ground':
      return const Color(0x00da7c4d);
    case 'ice':
      return const Color(0x0075d0c1);
    case 'normal':
      return const Color(0x00a0a29f);
    case 'poison':
      return const Color(0x00b763cf);
    case 'psychic':
      return const Color(0x00fa8581);
    case 'rock':
      return const Color(0x00c9bb8a);
    case 'steel':
      return const Color(0x005695a3);
    case 'water':
      return const Color(0x00539ddf);
  }
  return null;
}
