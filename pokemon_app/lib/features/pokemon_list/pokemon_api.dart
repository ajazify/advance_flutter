import 'package:http/http.dart' as http;
import 'package:pokemon_app/features/pokemon_list/pokemon_list_response.dart';

class PokemonApi {
  var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
  String? previousUrl;
  String? nextUrl;

  late PokemonListResponse _pokemonListResponse;

  Future<PokemonListResponse> fetchList(Uri? dynamicUrl) async {
    try {
      var response = await http.get(dynamicUrl ?? url);
      _pokemonListResponse = pokemonListResponseFromJson(response.body);
      return _pokemonListResponse;
    } catch (e) {
      throw Exception();
    }
  }
}
