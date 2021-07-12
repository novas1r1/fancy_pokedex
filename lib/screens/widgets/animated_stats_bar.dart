import 'package:fancy_pokedex/models/pokemon_stats.dart';
import 'package:flutter/material.dart';

class AnimatedStatsBar extends StatelessWidget {
  final PokemonStatsAttribute stats;

  const AnimatedStatsBar({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = stats.value / PokemonStats.maxStatsValue;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: Duration(milliseconds: 2000),
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stats.title,
                  style: TextStyle(color: Colors.white),
                ),
                Text((value * 100).toInt().toString() + "%"),
              ],
            ),
            SizedBox(height: 16 / 2),
            LinearProgressIndicator(
              value: value,
              color: stats.color,
              backgroundColor: (stats.color as MaterialColor).shade100,
            ),
          ],
        ),
      ),
    );
  }
}
