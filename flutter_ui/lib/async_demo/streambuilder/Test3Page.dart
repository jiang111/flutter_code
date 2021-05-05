import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';
import 'package:flutter_speedcode/async_demo/streambuilder/NetState.dart';
import 'package:flutter_speedcode/async_demo/widget/error.dart';
import 'package:flutter_speedcode/async_demo/widget/film.dart';
import 'package:flutter_speedcode/async_demo/widget/loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test3Page extends StatefulWidget {
  @override
  _Test3PageState createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3Page> {
  StreamController<NetState> streamController;

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

  String title = "StreamBuilder()的使用";

  @override
  void initState() {
    streamController = StreamController();
    super.initState();

    loadNetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: loadNetData,
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: StreamBuilder<NetState>(
          stream: streamController.stream,
          builder: (context, snap) {
            Widget result;
            if (snap.data != null) {
              if (snap.data is LoadingState) {
                result = LoadingWidget();
              } else if (snap.data is ErrorState) {
                result = Error1Widget();
              } else if (snap.data is ContentState) {
                result = Film((snap.data as ContentState).film);
              }
            }

            if (result == null) {
              result = Container(
                width: 0,
                height: 0,
              );
            }
            return result;
          },
        ),
      ),
    );
  }

  void loadNetData() {
    streamController.sink.add(LoadingState());
    _loadData(false).then((v) {
      streamController.sink.add(ContentState(v));
    }).catchError((e) {
      streamController.sink.add(ErrorState());
    });
  }
}
