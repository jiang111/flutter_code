import 'package:flutter/material.dart';

import 'home_left.dart';
import 'home_right.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: HomeLeftWidget(),
            ),
            Expanded(
              flex: 10,
              child: HomeRightWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
