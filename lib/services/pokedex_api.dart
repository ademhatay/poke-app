import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexApi {
  static const String _baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> pokemonList = [];

    await Dio().get(_baseUrl).then((value) {
      value.data['pokemon'].forEach((pokemon) {
        pokemonList.add(PokemonModel.fromJson(pokemon));
      });
    });

    debugPrint('pokemonList: $pokemonList');

    return pokemonList;
  }
}
