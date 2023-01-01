import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokecenter/widgets/main_appbar.dart';
import 'package:pokecenter/widgets/pokemon_card.dart';

class DictScreen extends StatelessWidget {
  final Future<List<PokemonSpecie?>> pokemonSpecie =
      PokeAPI.getObjectList<PokemonSpecie>(800, 905);
  final Future<List<Pokemon?>> pokemon =
      PokeAPI.getObjectList<Pokemon>(800, 905);

  DictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: FutureBuilder(
        future: Future.wait([
          pokemonSpecie,
          pokemon,
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data![0].length,
              itemBuilder: (context, index) {
                final pokemonSpecie = snapshot.data![0][index];
                final pokemon = snapshot.data![1][index];
                return PokemonCard(
                  id: pokemonSpecie.id,
                  name: pokemonSpecie.name,
                  typeName: pokemon.types,
                  typeColor: Colors.amber,
                  frontDefaultSprite: pokemon.sprites.frontDefault,
                  pokemonColor: pokemonSpecie.color.name,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}
