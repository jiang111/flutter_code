import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';
import 'package:flutter_speedcode/async_demo/widget/error.dart';
import 'package:flutter_speedcode/async_demo/widget/film.dart';
import 'package:flutter_speedcode/async_demo/widget/loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test2Page extends StatefulWidget {
  @override
  _Test2PageState createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  String title = "FutureBuilder()的使用";

  Future future;

  Future<film_list> _loadData(bool needException) async {
    var response = await http.get(
        "http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10");

    print(response.body);
    if (needException) {
      return Future.error("请求失败");
    }

    if (response.statusCode == 200) {
      return film_list.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("请求失败");
    }
  }

  @override
  void initState() {
    super.initState();
    future = _loadData(false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          title = "FutureBuilder()的使用.";
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: FutureBuilder<film_list>(
          future: future,
          builder: (context, snap) {
            Widget result;

            if (snap.connectionState == ConnectionState.waiting) {
              result = LoadingWidget();
            } else if (snap.connectionState == ConnectionState.done) {
              if (snap.hasError) {
                result = Error1Widget();
              } else {
                result = Film(snap.data);
              }
            }

            return result;
          },
        ),
      ),
    );
  }
}
