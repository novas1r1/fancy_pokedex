import 'package:flutter/material.dart';

class Utils {
  static Color getColorByType(String pokemonType) {
    switch (pokemonType) {
      case 'poison':
        return Colors.purple.shade200;
      case 'grass':
        return Colors.green.shade200;
      case 'fire':
        return Colors.red.shade200;
      case 'water':
        return Colors.blue.shade200;
      case 'flying':
        return Colors.grey.shade200;
      case 'bug':
        return Colors.brown.shade200;
      case 'electric':
        return Colors.yellow.shade200;
      case 'psychic':
        return Colors.deepPurple.shade200;
      case 'ground':
        return Colors.deepOrange.shade200;
      case 'fairy':
        return Colors.pink.shade200;
      case 'fighting':
        return Colors.blueGrey.shade200;
      case 'rock':
        return Colors.black38;
      case 'ice':
        return Colors.lightBlue.shade200;
      default:
        return Colors.grey;
    }
  }

  static Image getImageForType(String pokemonType) {
    return Image.asset('assets/images/$pokemonType.png');
  }

  static String generateIdText(int pokedexId) {
    if (pokedexId.toString().length == 1) {
      return '#00$pokedexId';
    } else if (pokedexId.toString().length == 2) {
      return '#0$pokedexId';
    }
    return '#$pokedexId';
  }
}
