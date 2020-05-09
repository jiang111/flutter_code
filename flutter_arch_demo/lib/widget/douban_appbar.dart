import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DouBanAppBar {
  final String title;
  final bool canBack;
  final List<Widget> actions;

  DouBanAppBar({this.title, this.canBack = true, this.actions});

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: canBack,
      actions: actions,
    );
  }
}
