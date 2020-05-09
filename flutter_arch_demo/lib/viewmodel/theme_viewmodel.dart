import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/base/baseviewmodel.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeData themeData = light();

  bool lighted = true;

  changeTheme() {
    if (lighted) {
      themeData = dark();
    } else {
      themeData = light();
    }
    lighted = !lighted;

    notifyListeners();
  }

  static ThemeData light() {
    return ThemeData(
      textTheme: TextTheme(
          subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 16,
      )),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: Color(0xff248bfe),
      appBarTheme: AppBarTheme(
        elevation: 0,
        textTheme: TextTheme(
            subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 16,
        )),
      ),
    );
  }

  ThemeData dark() {
    return ThemeData(
      textTheme: TextTheme(
          subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 16,
      )),
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Color(0xff000000),
      appBarTheme: AppBarTheme(
        elevation: 0,
        textTheme: TextTheme(
            subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 16,
        )),
      ),
    );
  }
}
