import 'package:flutter_provider_movies/api/api.dart';
import 'package:flutter_provider_movies/bean/film_list_bean.dart';
import 'package:flutter_provider_movies/model/base_model.dart';

class MoviesModel extends BaseModel {
  Api _api;

  MoviesModel(Api api) {
    this._api = api;
  }

  FilmListBean filmListBean;

  Future<FilmListBean> getMovies() async {
    loadingg(true);
    filmListBean = await _api.getMovies();
    loadingg(false);
  }
}
