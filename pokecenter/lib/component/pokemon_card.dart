import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokecenter/component/poke_button.dart';
import 'package:pokecenter/component/poke_info.dart';
import 'package:pokecenter/component/type_container.dart';
import 'package:pokecenter/model/type_model.dart';

class PokemonCard extends StatelessWidget {
  final int? id;
  final String name;
  final String? frontDefaultSprite;
  final List<TypeModel> typeModel;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.frontDefaultSprite,
    required this.typeModel,
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
          builder: (context, snapshot) {
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
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                PokeInfo(id: id, name: name),
                                const SizedBox(width: 15),
                                const PokeButton(),
                              ],
                            ),
                            const SizedBox(height: 15),
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
                                    for (int i = 0;
                                        i < typeModel.length;
                                        i++) ...[
                                      if (i > 0) const SizedBox(width: 10),
                                      TypeContainer(
                                        type: typeModel[i].koName,
                                        typeColor: typeModel[i].typeColor,
                                        iconPath: typeModel[i].iconPath,
                                      ),
                                    ],
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
                                child: Image.network(frontDefaultSprite!),
                              ),
                              const SizedBox(width: 10),
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
