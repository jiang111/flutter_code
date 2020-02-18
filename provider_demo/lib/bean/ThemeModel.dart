import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  ThemeData themeData;

  ThemeType currentType;

  ThemeModel(ThemeType type) {
    currentType = type;
    if (type == ThemeType.dark) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }

  void reverse() {
    if (currentType == ThemeType.light) {
      _update(ThemeType.dark);
    } else {
      _update(ThemeType.light);
    }
  }

  void _update(ThemeType type) {
    currentType = type;

    if (type == ThemeType.light) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }

    notifyListeners();
  }
}

enum ThemeType {
  light,
  dark,
}
