import 'package:http/http.dart' as http;
import 'package:pokemon_app/features/pokemon_detail/pokemon_detail_response.dart';

class PokemonDetailApi {
  late PokemonDetailResponse _pokemonResponse;

  Future<PokemonDetailResponse> fetchList({required Uri dynamicUrl}) async {
    try {
      var response = await http.get(dynamicUrl);
      _pokemonResponse = pokemonDetailResponseFromJson(response.body);
      return _pokemonResponse;
    } catch (e) {
      throw Exception();
    }
  }
}
