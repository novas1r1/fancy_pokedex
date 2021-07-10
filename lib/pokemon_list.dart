import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/pokemon.dart';
import 'widgets/pokemon_tile.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokédex',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 58.0),
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(40),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(40),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: loadPokemon(),
        initialData: [],
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Pokemon>> snapshot,
        ) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return PokemonTile(pokemon: snapshot.data![index]);
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<List<Pokemon>> loadPokemon() async {
    final String pokemonJson =
        await rootBundle.loadString('assets/data/pokemon.json');

    final Iterable pokemonMap = await jsonDecode(pokemonJson);

    final List<Pokemon> pokemonList =
        pokemonMap.map((pokemon) => Pokemon.fromMap(pokemon)).toList();

    return pokemonList;
  }
}
