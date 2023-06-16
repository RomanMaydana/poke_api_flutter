
import 'package:http_example/utils/network_helper.dart';

import '../data/pokemon.dart';

abstract class IPokeApi{
  Future<List<Pokemon>> getPokemons();
}

class PokeApi extends IPokeApi{
  final _networkHerlper = NetworkHelper();

  @override
  Future<List<Pokemon>> getPokemons()async {
    const url = "https://pokeapi.co/api/v2/pokemon";
    final pokemons = await _networkHerlper.get(url);
    return pokemons['results'].map<Pokemon>((data)=> Pokemon.fromJson(data)).toList();
  }

}