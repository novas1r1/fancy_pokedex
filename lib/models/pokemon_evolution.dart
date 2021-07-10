import 'dart:convert';

class PokemonEvolution {
  final int evolutionLevel;
  final String evolutionMethod;
  final String evolutionName;

  PokemonEvolution({
    required this.evolutionLevel,
    required this.evolutionMethod,
    required this.evolutionName,
  });

  PokemonEvolution copyWith({
    int? evolutionLevel,
    String? evolutionMethod,
    String? evolutionName,
  }) {
    return PokemonEvolution(
      evolutionLevel: evolutionLevel ?? this.evolutionLevel,
      evolutionMethod: evolutionMethod ?? this.evolutionMethod,
      evolutionName: evolutionName ?? this.evolutionName,
    );
  }

  factory PokemonEvolution.fromMap(Map<String, dynamic> map) {
    return PokemonEvolution(
      evolutionLevel: map['level'] ?? 0,
      evolutionMethod: map['method'],
      evolutionName: map['to'],
    );
  }

  factory PokemonEvolution.fromJson(String source) =>
      PokemonEvolution.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonEvolution(evolutionLevel: $evolutionLevel, evolutionMethod: $evolutionMethod, evolutionName: $evolutionName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonEvolution &&
        other.evolutionLevel == evolutionLevel &&
        other.evolutionMethod == evolutionMethod &&
        other.evolutionName == evolutionName;
  }

  @override
  int get hashCode =>
      evolutionLevel.hashCode ^
      evolutionMethod.hashCode ^
      evolutionName.hashCode;
}
