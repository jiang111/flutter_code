import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_movies/bean/theme_bean.dart';
import 'package:flutter_provider_movies/bean/user_bean.dart';
import 'package:flutter_provider_movies/model/movies_model.dart';
import 'package:flutter_provider_movies/widget/film.dart';
import 'package:flutter_provider_movies/widget/provider_widget.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("${Provider.of<UserBean>(context, listen: true).name}的电影列表"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {
                  Provider.of<ThemeBean>(context, listen: false).change();
                },
                child: Icon(Icons.brightness_4)),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ProviderWidget<MoviesModel>(
          model: MoviesModel(Provider.of(context)),
          onReady: (model) => model.getMovies(),
          builder: (context, model, child) {
            if (model.loading) {
              return Center(child: FlutterLogo());
            } else {
              return Film(model.filmListBean);
            }
          },
        ),
      ),
    );
  }
}
