import 'dart:convert';
import 'package:tv_tutorial/widgets/movies-widget.dart';

import 'models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Movie> _movies = new List<Movie>();

  @override
  void initState() {
    super.initState();
    populateMovies();
  }

  void populateMovies() async {
    final movies = await _getMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _getMovies() async {
    final response = await http.get(
        "https://www.omdbapi.com/?s=Batman&page=2&apikey=[YOUR API KEY HERE]");

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Movie Request Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MOVIES APP",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Movies"),
          ),
          body: MoviesWidget(movies: _movies),
        ));
  }
}
