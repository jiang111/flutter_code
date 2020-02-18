import 'package:flutter/material.dart';
import 'package:flutter_provider_demos/bean/ThemeModel.dart';
import 'package:flutter_provider_demos/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      FutureProvider<String>(
        create: (_) {
          return Future.delayed(Duration(seconds: 2), () {
            return "this is future provider";
          });
        },
        initialData: "this is a initialData from futureprovider",
        child: StreamProvider<int>(
          create: (_) {
            return Stream.periodic(Duration(milliseconds: 500), (v) {
              return v * 3;
            }).take(100);
          },
          lazy: false,
          updateShouldNotify: (_, __) {
            return true;
          },
          child: ChangeNotifierProvider<ThemeModel>(
            create: (_) {
              return ThemeModel(ThemeType.dark);
            },
            child: MyApp(),
          ),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeModel>(context, listen: true).themeData,
      home: HomePage(),
    );
  }
}
