import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';
import 'package:flutter_speedcode/async_demo/streambuilder2/StateManager.dart';
import 'package:flutter_speedcode/async_demo/streambuilder2/multi_state.dart';
import 'package:flutter_speedcode/async_demo/widget/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test4Page extends StatefulWidget {
  @override
  _Test4PageState createState() => _Test4PageState();
}

class _Test4PageState extends State<Test4Page> {
  StateManager stateManager;

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
  void dispose() {
    stateManager.dispose();
    super.dispose();
  }

  @override
  void initState() {
    stateManager = StateManager();
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: loadData,
      ),
      appBar: AppBar(
        title: Text("StreamBuilder的封装"),
      ),
      body: Container(
        child: MultiStateWidget<film_list>(
          streamController: stateManager.streamController,
          contentBuilder: (context, data) {
            return Film(data);
          },
        ),
      ),
    );
  }

  void loadData() {
    stateManager.loadingDialog();
    _loadData(false).then((v) {
      stateManager.content(v);
    }).catchError((e) {
      stateManager.error();
    });
  }
}
