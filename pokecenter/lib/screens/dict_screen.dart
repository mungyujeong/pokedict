import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokecenter/widgets/main_appbar.dart';
import 'package:pokecenter/widgets/pokemon_card.dart';

class DictScreen extends StatelessWidget {
  final Future<List<Pokemon?>> pokemon = PokeAPI.getObjectList<Pokemon>(1, 40);

  DictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: FutureBuilder(
        future: pokemon,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text("Error Occured");
            }
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pokemon = snapshot.data![index];
                return PokemonCard(
                  id: pokemon!.id,
                  name: pokemon.name,
                  typeName: pokemon.types!.first.type!.name,
                  typeColor: Colors.amber,
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
