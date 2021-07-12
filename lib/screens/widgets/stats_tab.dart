import 'package:fancy_pokedex/models/pokemon.dart';
import 'package:fancy_pokedex/models/pokemon_stats.dart';
import 'package:flutter/material.dart';

import 'animated_stats_bar.dart';

class StatsTab extends StatelessWidget {
  final Pokemon pokemon;

  const StatsTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...List.generate(
            pokemon.stats.attributes.length,
            (index) => _buildStatsRow(
              pokemon.stats.attributes[index],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(PokemonStatsAttribute stats) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(child: Text(stats.title)),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                // TODO CONTINUE check if this works
                AnimatedStatsBar(stats: stats),
                Positioned(
                  left: 4,
                  child: Center(
                    child: Text(
                      '${stats.value}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
