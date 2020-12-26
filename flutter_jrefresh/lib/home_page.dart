import 'package:flutter/material.dart';
import 'package:flutter_demo/j_refresh_indicator.dart';
import 'package:random_color/random_color.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool customScrollNotificationPredicate(ScrollNotification notification) {
    return notification.depth == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: JRefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2), () {});
          },
          notificationPredicate: (_){
            return true;
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: RandomColor().randomColor(),
              );
            },
            itemCount: 30,
          ),
        ),
      ),
    );
  }
}
