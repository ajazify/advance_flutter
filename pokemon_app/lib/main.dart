import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon_detail/pokemon_detail.dart';
import 'features/pokemon_list/pokemon_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const PokemonList(),
        '/pokemonDetails': (context) => const PokemonDetail(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const PokemonList(),
    );
  }
}
