import 'package:fancy_pokedex/models/pokemon.dart';
import 'package:fancy_pokedex/models/pokemon_stats.dart';
import 'package:flutter/material.dart';

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

class AnimatedStatsBar extends StatefulWidget {
  final PokemonStatsAttribute stats;

  AnimatedStatsBar({Key? key, required this.stats}) : super(key: key);

  @override
  _AnimatedStatsBarState createState() => _AnimatedStatsBarState();
}

class _AnimatedStatsBarState extends State<AnimatedStatsBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late double maxValue;

  @override
  void initState() {
    super.initState();
    maxValue = widget.stats.value / PokemonStats.maxStatsValue;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        if (controller.value < maxValue) {
          setState(() {});
        }
      });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 15,
      value: controller.value,
      color: widget.stats.color,
      backgroundColor: (widget.stats.color as MaterialColor).shade100,
    );
  }
}
