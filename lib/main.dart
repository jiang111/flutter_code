
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter SpeedCode(建议自己编译查看,web效果不理想)",
      home: HomePage(),
    );
  }
}
