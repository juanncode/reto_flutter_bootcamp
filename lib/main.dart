import 'package:flutter/material.dart';

import 'pages/detail_pokemon.dart';
import 'pages/list_pokemon.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Gilroy'),
    home: ListPokemon(),
    routes: {
      'detail-pokemon': (BuildContext context) => DetailPokemon()
    },
  ));
}
