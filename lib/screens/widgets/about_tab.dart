import 'package:fancy_pokedex/common/utils.dart';
import 'package:fancy_pokedex/models/pokemon.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;

  const AboutTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pokemon.description,
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              pokemon.types.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Utils.getColorByType(pokemon.types[index]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Utils.getImageForType(pokemon.types[index]),
                        ),
                        SizedBox(width: 4),
                        Text(pokemon.types[index].toUpperCase()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Pokédex Data',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          // TODO this is static data - needs to be put to JSON file for each pokemon
          _buildInfoRow('Height', '0.7'),
          _buildInfoRow('Weight', '6.9'),
          _buildInfoRow('Catch Rate', '45'),
        ],
      ),
    );
  }

  Row _buildInfoRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
