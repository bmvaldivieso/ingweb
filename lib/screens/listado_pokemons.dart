import 'package:appflutter/screens/pokemon_detail.dart';
import 'package:appflutter/screens/search_pokemon.dart';
import 'package:flutter/material.dart';
import '../service/pokemon_api_service.dart';

class ListadoPokemons extends StatelessWidget {
  ListadoPokemons({Key? key}) : super(key: key);

  final PokemonApiService pokemonApiService = PokemonApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Pokemons',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchPokemon());
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: pokemonApiService.getAllPokemons(),
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
      ),
    ));
  }
}
