import 'package:fancy_pokedex/pokemon_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red,
        focusColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.black87),
        accentIconTheme: IconThemeData(color: Colors.black87),
        primaryIconTheme: IconThemeData(color: Colors.black87),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: PokemonList(),
    );
  }
}
