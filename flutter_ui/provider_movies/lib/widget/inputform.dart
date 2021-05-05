import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputFormWidget extends StatefulWidget {
  TextEditingController _controller;

  InputFormWidget(TextEditingController controller) {
    _controller = controller;
  }

  @override
  _InputFormWidgetState createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: EdgeInsets.only(
        top: 150,
      ),
      child: TextField(
        controller: widget._controller,
        decoration: InputDecoration(hintText: "请输入用户名"),
      ),
    );
  }
}