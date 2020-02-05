import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';
import 'package:flutter_speedcode/async_demo/widget/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test1Page extends StatefulWidget {
  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1Page> {
  film_list film;
  bool loading;
  bool error;

  @override
  void initState() {
    super.initState();
    loadData().then((v) {
      film = v;
      loading = false;
      error = false;
      setState(() {});
    }).catchError((e) {
      loading = false;
      error = true;
      setState(() {});
    });
  }

  void reset() {
    loading = true;
    error = false;
  }

  Future<film_list> loadData() async {
    reset();
    var response = await http.get(
        "http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10");

    print(response.body);

    if (response.statusCode == 200) {
      return film_list.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("加载失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setState()用法"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return loading
        ? Center(
            child: Text("加载中..."),
          )
        : (error
            ? Center(
                child: Text("加载失败..."),
              )
            : Film(film));
  }
}
