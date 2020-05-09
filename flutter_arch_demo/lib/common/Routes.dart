import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arch_demo/view/main_page.dart';

class Routes {
  static const String main_page = "/main/mainPage";

  static Route findRoutes(RouteSettings setting) {
    String name = setting.name;
    Object argument = setting.arguments;

    return CupertinoPageRoute(builder: (_) {
      return _findPage(name, argument);
    });
  }

  static Widget _findPage(String name, Object object) {
    Widget page;
    switch (name) {
      case main_page:
        page = MainPage();
        break;
    }
    return page;
  }
}
