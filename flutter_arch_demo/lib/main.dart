import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/common/Routes.dart';
import 'package:flutter_arch_demo/view/splash_page.dart';
import 'package:flutter_arch_demo/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';

//provider
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeViewModel>(
      create: (_) => ThemeViewModel(),
      child: Builder(
        builder: (context) => MaterialApp(
          onGenerateRoute: (setting) {
            return Routes.findRoutes(setting);
          },
          theme: Provider.of<ThemeViewModel>(context, listen: true).themeData,
          home: SplashPage(),
        ),
      ),
    );
  }
}
