import 'package:flutter_provider_movies/api/api.dart';
import 'package:flutter_provider_movies/bean/user_bean.dart';

import 'base_model.dart';

class UserModel extends BaseModel {
  Api _api;

  UserModel(Api api) {
    this._api = api;
  }

  Future<UserBean> login(String name) async {
    loadingg(true);
    UserBean result = await _api.login(name);
    loadingg(false);
    return result;
  }
}
