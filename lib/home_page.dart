import 'package:flutter/material.dart';
import 'package:flutter_speedcode/ui_2/home_page.dart' as ui_2;
import 'package:flutter_speedcode/ui_3/home_page.dart' as ui_3;
import 'package:flutter_speedcode/ui_1/home_page.dart' as ui_1;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _list = [
      "assets/images/show1.jpg",
      "assets/images/show2.png",
      "assets/images/show3.png"
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter SpeedCode (web端效果不理想,建议自己编译原生应用)"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ui_1.HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Text(
                  "Flutter精美UI系列视频教程-1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ui_2.HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Text(
                  "Flutter精美UI系列视频教程-2",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ui_3.HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Text(
                  "Flutter精美UI系列视频教程-3",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
