import 'package:dio_log/overlay_draggable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/common/Routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    showDebugBtn(context);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Routes.main_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Center(
          child: Text(
            "豆瓣",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
