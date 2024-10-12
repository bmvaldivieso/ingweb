import 'package:appflutter/screens/pokemon_detail.dart';
import 'package:flutter/material.dart';
import '../service/pokemon_api_service.dart';

class SearchPokemon extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  final PokemonApiService pokemonApiService2 = PokemonApiService();

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: pokemonApiService2.getAllPokemons(
            query:
                query), // Pasar la consulta de búsqueda al método getAllPokemons
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Map<String, dynamic>> pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                final name = pokemon['name'];
                final number = pokemon['id'];
                final imageUrl = pokemon['sprites']['front_default'];

                return ListTile(
                  leading: Image.network(imageUrl),
                  title: Text('#$number - $name'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailScreen(pokemon: pokemon),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error al obtener la lista de Pokémon');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Buscando Pokemon'),
    );
  }
}
