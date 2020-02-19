import 'package:flutter/material.dart';
import 'package:flutter_provider_movies/bean/theme_bean.dart';
import 'package:flutter_provider_movies/provider_setup.dart';
import 'package:flutter_provider_movies/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: providers,
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeBean>(context, listen: true).themeData,
      home: HomePage(),
    );
  }
}
