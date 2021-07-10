import 'package:flutter/material.dart';

class PokemonStats {
  static const maxStatsValue = 255;
  static List<PokemonStatsAttribute> testAttributes = [
    PokemonStatsAttribute(
      title: 'HP',
      color: Colors.red,
      value: 45,
    ),
    PokemonStatsAttribute(
      title: 'Attack',
      color: Colors.orange,
      value: 49,
    ),
    PokemonStatsAttribute(
      title: 'Sp. Atk.',
      color: Colors.blue,
      value: 49,
    ),
    PokemonStatsAttribute(
      title: 'Defense',
      color: Colors.yellow,
      value: 65,
    ),
    PokemonStatsAttribute(
      title: 'Sp. Def.',
      color: Colors.green,
      value: 65,
    ),
    PokemonStatsAttribute(
      title: 'Speed',
      color: Colors.pink,
      value: 45,
    ),
  ];

  final List<PokemonStatsAttribute> attributes;

  PokemonStats({
    required this.attributes,
  });
}

class PokemonStatsAttribute {
  final int value;
  final Color color;
  final String title;

  PokemonStatsAttribute({
    required this.value,
    required this.color,
    required this.title,
  });
}

/* class PokemonStatsAttribute {
  final int hp;
  final Color hpColor;
  final String hpTitle;

  final int attack;
  final Color attackColor;

  final int defense;
  final Color defenseColor;

  final int specialAttack;
  final Color specialAttackColor;

  final int specialDefense;
  final Color specialDefenseColor;

  final int speed;
  final Color speedColor;

  const PokemonStatsAttribute({
    this.hp = 45,
    this.hpColor = Colors.red,
    this.attack = 49,
    this.defense = 49,
    this.specialAttack = 65,
    this.specialDefense = 65,
    this.speed = 45,
    this.attackColor = Colors.orange,
    this.defenseColor = Colors.yellow,
    this.specialAttackColor = Colors.blue,
    this.specialDefenseColor = Colors.green,
    this.speedColor = Colors.pink,
  });
} */
