import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/futurebuilder/Test2Page.dart';
import 'package:flutter_speedcode/async_demo/setstate/Test1Page.dart';
import 'package:flutter_speedcode/async_demo/streambuilder/Test3Page.dart';
import 'package:flutter_speedcode/async_demo/streambuilder2/Test4Page.dart';

class AsyncHomePage extends StatefulWidget {
  @override
  _AsyncHomePageState createState() => _AsyncHomePageState();
}

class _AsyncHomePageState extends State<AsyncHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Test1Page()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("setState()用法"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Test2Page()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("FutureBuilder()用法"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Test3Page()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("StreamBuilder()用法"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Test4Page()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("StreamBuilder封装"),
            ),
          ),
        ],
      ),
    );
  }
}
