import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';

class FilmCell extends StatelessWidget {
  Subjects subjects;

  FilmCell(this.subjects);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            subjects.images.medium,
            width: MediaQuery.of(context).size.width / 3 - 20,
            height: (MediaQuery.of(context).size.width / 3 - 20) * 1.5,
          ),
          Text(
            subjects.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
