import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/models/film.dart';
import 'package:http/http.dart' as http;
import 'package:movie/widgets/film_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Film> _films = [];

  Future<List<Film>> _fetchFilms() async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/films/?format=json'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['title'];
      return list.map((e) => Film.fromJson(e)).toList();
    } else {
      throw Exception('failed');
    }
  }

  void populateFilms() async {
    final myFilms = await _fetchFilms();
    _films.addAll(myFilms);
    print(_films[1].title);
  }

  @override
  Widget build(BuildContext context) {
    populateFilms();
    return Scaffold(
        appBar: AppBar(title: Text('mal')),
        body: _films.isEmpty? const Center(child: CircularProgressIndicator(),)
        :GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30),
          itemBuilder: (ctx, i) => FilmItem(
              _films[i].title, _films[i].episode_id, _films[i].producer),
          itemCount: _films.length,
          padding: const EdgeInsets.all(10),
        ));
  }
}
