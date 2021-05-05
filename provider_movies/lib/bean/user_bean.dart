import 'package:flutter/material.dart';

class UserBean with ChangeNotifier {
  String name;
  int age;

  UserBean({this.name = "", this.age});

  void update(UserBean userBean) {
    this.name = userBean.name;
    this.age = userBean.age;
    notifyListeners();
  }
}
