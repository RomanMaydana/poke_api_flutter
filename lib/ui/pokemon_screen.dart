import 'package:flutter/material.dart';
import 'package:http_example/api/poke_api.dart';
import 'package:http_example/data/pokemon.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  Future<List<Pokemon>> getPokemons() async {
    final pokeApi = PokeApi();
    final result = await pokeApi.getPokemons();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: FutureBuilder(
          future: getPokemons(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final pokemons = snapshot.data!;
              print('${pokemons.length} pokemons.length');
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2
                ),
                itemCount: pokemons.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                                'https://img.pokemondb.net/artwork/large/${pokemon.name}.jpg'),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            pokemon.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
