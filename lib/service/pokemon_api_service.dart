import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonApiService {
  Future<List<Map<String, dynamic>>> getAllPokemons({String? query}) async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=150'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> results = data['results'];
      if (query != null) {
        results = results
            .where((element) =>
                element['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      final List<Future<Map<String, dynamic>>> pokemonsFutures =
          results.map((result) async {
        final pokemonResponse = await http.get(Uri.parse(result['url']));
        if (pokemonResponse.statusCode == 200) {
          return jsonDecode(pokemonResponse.body)
              as Map<String, dynamic>; // Conversión de tipo
        } else {
          throw Exception('Error al obtener el Pokémon ${result['name']}');
        }
      }).toList();

      final List<Map<String, dynamic>> pokemons =
          await Future.wait(pokemonsFutures);

      return pokemons;
    } else {
      throw Exception('Error al obtener la lista de Pokémon');
    }
  }
}
