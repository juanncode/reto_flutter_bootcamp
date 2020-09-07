import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  String _urlBase =  "https://api.sandbox.doapps.pe/";

  Future<List> getListPokemon() async {
    try {
      var response = await http.get('${_urlBase}pokedex/pokemons');
      return convert.jsonDecode(response.body);
    } catch(e) {
      return e;
    }
  }

  Future<Map> getDetailPokemon(int id) async {
    try {
      var response = await http.get('${_urlBase}pokedex/pokemons/$id');
      return convert.jsonDecode(response.body);
    } catch(e) {
      return e;
    }
  }
}