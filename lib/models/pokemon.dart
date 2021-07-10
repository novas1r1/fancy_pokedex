import 'dart:convert';

import 'package:fancy_pokedex/models/pokemon_stats.dart';
import 'package:flutter/foundation.dart';

import 'package:fancy_pokedex/models/pokemon_evolution.dart';

class Pokemon {
  final int pokedexId;
  final String name;
  final String imageUrl;
  final String description;
  final String artUrl;
  final List<String> types;
  final List<PokemonEvolution> evolutions;
  final PokemonStats stats;

  Pokemon({
    required this.pokedexId,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.artUrl,
    required this.types,
    required this.evolutions,
    required this.stats,
  });

  Pokemon copyWith({
    int? pokedexId,
    String? name,
    String? imageUrl,
    String? description,
    String? artUrl,
    List<String>? types,
    List<PokemonEvolution>? evolutions,
    PokemonStats? stats,
  }) {
    return Pokemon(
      pokedexId: pokedexId ?? this.pokedexId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      artUrl: artUrl ?? this.artUrl,
      types: types ?? this.types,
      evolutions: evolutions ?? this.evolutions,
      stats: stats ?? this.stats,
    );
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      pokedexId: map['pkdx_id'],
      name: map['name'],
      imageUrl: map['image_url'],
      description: map['description'],
      artUrl: map['art_url'],
      types: List<String>.from(map['types']),
      stats: PokemonStats(attributes: PokemonStats.testAttributes),
      evolutions: List<PokemonEvolution>.from(
          map['evolutions']?.map((x) => PokemonEvolution.fromMap(x))),
    );
  }

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pokemon(pokedexId: $pokedexId, name: $name, imageUrl: $imageUrl, description: $description, artUrl: $artUrl, types: $types, evolutions: $evolutions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon &&
        other.pokedexId == pokedexId &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.artUrl == artUrl &&
        listEquals(other.types, types) &&
        listEquals(other.evolutions, evolutions);
  }

  @override
  int get hashCode {
    return pokedexId.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        artUrl.hashCode ^
        types.hashCode ^
        evolutions.hashCode;
  }
}
