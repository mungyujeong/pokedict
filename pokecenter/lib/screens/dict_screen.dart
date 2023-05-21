import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokecenter/component/main_app_bar.dart';
import 'package:pokecenter/component/main_drawer.dart';
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
        PokeAPI.getObjectList<PokemonSpecie>(1, 1010);
    final Future<List<Pokemon?>> pokemon =
        PokeAPI.getObjectList<Pokemon>(1, 1010);

    // Wait for both API calls to complete
    final results = await Future.wait([pokemonSpecie, pokemon]);

    // Create a map to store the results
    Map<String, List<dynamic>?> pokemonData = {
      'pokemonSpecie': results[0],
      'pokemon': results[1],
    };
    return pokemonData;
  }

  bool isStared = false;
  bool isCircled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: MainAppBar(
        appBar: AppBar(),
        isCircled: isCircled,
        isStared: isStared,
      ),
      body: FutureBuilder<Map<String, List<dynamic>?>>(
        future: fetchPokemonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('fetchPokemonData 에러 발생'),
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
              itemCount: pokemonSpeices!.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons![index];
                final pokemonSpecie = pokemonSpeices[index];

                final id = pokemonSpecie.id;
                final sprite = pokemon.sprites.frontDefault;
                final koName = pokemonSpecie.names[2].name;
                final types = DataUtils.getTypeModel(types: pokemon.types);

                return PokemonCard(
                  id: id,
                  name: koName,
                  frontDefaultSprite: sprite,
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
