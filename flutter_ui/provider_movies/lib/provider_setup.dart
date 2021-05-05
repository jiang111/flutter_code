import 'package:flutter/material.dart';
import 'package:flutter_provider_movies/api/api.dart';
import 'package:flutter_provider_movies/bean/theme_bean.dart';
import 'package:flutter_provider_movies/bean/user_bean.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildStatelessWidget> providers = [
  Provider<Api>(
    create: (_) => Api(),
  ),
  ChangeNotifierProvider<ThemeBean>(
    create: (_) => ThemeBean(
      themeType: ThemeType.dark,
      themeData: ThemeData.dark(),
    ),
  ),
  ChangeNotifierProvider<UserBean>(
    create: (_) => UserBean(),
  ),
];
