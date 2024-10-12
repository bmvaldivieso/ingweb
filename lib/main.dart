import 'package:appflutter/screens/listado_pokemons.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/screens/carnet_page.dart';

import 'package:appflutter/screens/counter_page.dart';
import 'package:appflutter/screens/listado_noticias.dart';
import 'package:appflutter/screens/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
      routes: {
        '/contador': (BuildContext context) => const CounterPage(),
        '/carnet': (BuildContext context) => const CarnetPage(),
        '/noticias': (BuildContext context) => const ListadoNoticias(),
        '/pokemons': (BuildContext context) => ListadoPokemons()
      },
    );
  }
}
