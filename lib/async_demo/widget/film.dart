import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';

import 'film_cell.dart';

class Film extends StatefulWidget {
  film_list film;

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
