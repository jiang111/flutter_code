import 'package:flutter/material.dart';

class ThemeBean with ChangeNotifier {
  ThemeData themeData;
  ThemeType themeType;

  ThemeBean({this.themeData, this.themeType});

  void change() {
    if (themeType == ThemeType.light) {
      themeData = ThemeData.dark();
      themeType = ThemeType.dark;
    } else {
      themeData = ThemeData.light();
      themeType = ThemeType.light;
    }
    notifyListeners();
  }
}

enum ThemeType {
  light,
  dark,
}
