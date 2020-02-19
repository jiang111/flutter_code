import 'package:flutter/material.dart';
import 'package:flutter_provider_movies/bean/film_list_bean.dart';

import 'film_cell.dart';

class Film extends StatefulWidget {
  FilmListBean film;

  Film(this.film);

  @override
  _FilmState createState() => _FilmState();
}

class _FilmState extends State<Film> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Wrap(
          children: <Widget>[
            ...widget.film.subjects.map((f) => FilmCell(f)).toList()
          ],
        ),
      ),
    );
  }
}
