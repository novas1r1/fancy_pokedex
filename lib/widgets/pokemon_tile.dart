import 'package:fancy_pokedex/common/utils.dart';
import 'package:fancy_pokedex/models/pokemon.dart';
import 'package:fancy_pokedex/screens/pokemon_details_screen.dart';
import 'package:flutter/material.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PokemonDetailsScreen(pokemon: pokemon),
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Utils.getColorByType(pokemon.types.first),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 3,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: '${pokemon.name}',
                  child: Image.network(
                    pokemon.artUrl,
                    cacheHeight: 150,
                    height: 75,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        pokemon.types.length,
                        (index) => SizedBox(
                          height: 25,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Utils.getImageForType(pokemon.types[index]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: Text(
              Utils.generateIdText(pokemon.pokedexId),
              style: TextStyle(
                fontSize: 40,
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
