import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("第二页"),
      ),
      body: Container(
        child: FlatButton(
            onPressed: () {
            },
            child: Text("第二页按钮")),
      ),
    );
  }
}
