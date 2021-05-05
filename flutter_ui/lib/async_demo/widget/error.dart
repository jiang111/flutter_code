import 'package:flutter/material.dart';

class Error1Widget extends StatefulWidget {
  @override
  _Error1WidgetState createState() => _Error1WidgetState();
}

class _Error1WidgetState extends State<Error1Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("error..."),
      ),
    );
  }
}
