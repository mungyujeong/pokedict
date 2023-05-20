import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokecenter/component/main_appbar.dart';
import 'package:pokecenter/component/pokemon_card.dart';
import 'package:pokecenter/utils/data_utils.dart';

class DictScreen extends StatefulWidget {
  const DictScreen({super.key});

  @override
  State<DictScreen> createState() => _DictScreenState();
}

class _DictScreenState extends State<DictScreen> {
  @override
  void initState() {
    // TODO: implement initState
    fetchPokemonData();
  }

  Future<Map<String, List<dynamic>?>> fetchPokemonData() async {
    final Future<List<PokemonSpecie?>> pokemonSpecie =
        PokeAPI.getObjectList<PokemonSpecie>(1, 100);
    final Future<List<Pokemon?>> pokemon =
        PokeAPI.getObjectList<Pokemon>(1, 100);

    // Wait for both API calls to complete
    final results = await Future.wait([pokemonSpecie, pokemon]);

    // Create a map to store the results
    Map<String, List<dynamic>?> pokemonData = {
      'pokemonSpecie': results[0],
      'pokemon': results[1],
    };
    // print(pokemonData);
    return pokemonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: FutureBuilder<Map<String, List<dynamic>?>>(
        future: fetchPokemonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('에러 발생'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          Map<String, List<dynamic>?> pokemonData = snapshot.data!;
          final pokemons = pokemonData['pokemon'];
          final pokemonSpeices = pokemonData['pokemonSpecie'];

          return SingleChildScrollView(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: pokemons!.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                final pokemonSpecie = pokemonSpeices?[index];
                final types = DataUtils.getTypeModel(types: pokemon.types);
                final name = pokemonSpecie.names[2].name;
                print(name);

                return PokemonCard(
                  id: pokemonSpecie.id,
                  name: name,
                  frontDefaultSprite: pokemon.sprites.frontDefault,
                  typeModel: types,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          );
        },
      ),
    );
  }
}
