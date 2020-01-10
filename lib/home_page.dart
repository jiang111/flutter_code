import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speedcode/async_demo/home_page.dart';
import 'package:flutter_speedcode/ui_2/home_page.dart' as ui_2;
import 'package:flutter_speedcode/ui_3/home_page.dart' as ui_3;
import 'package:flutter_speedcode/ui_1/home_page.dart' as ui_1;
import 'package:flutter_speedcode/ui_4/home_page.dart' as ui_4;
import 'package:flutter_speedcode/ui_5/home_page.dart' as ui_5;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        centerTitle: false,
        title: Text(
          "Flutter精美UI系列视频",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              const url = 'https://space.bilibili.com/480410119';
              _launchURL(url);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              child: Text(
                "视频地址",
                style: TextStyle(
                  color: Color(0xff248bfe),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              const url = 'https://github.com/jiang111/flutter_code';
              _launchURL(url);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              child: Text(
                "源码",
                style: TextStyle(
                  color: Color(0xff248bfe),
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: kIsWeb
              ? _buildWeb(context)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text:
                                'https://github.com/jiang111/flutter_code/raw/master/art/app-release.apk'));

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("复制成功,打来浏览器粘贴链接即可下载"),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 30,
                        ),
                        child: Center(
                          child: Text(
                            "点我复制app的下载地址",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ui_1.HomePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          "Flutter精美UI系列视频-1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ui_2.HomePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          "Flutter精美UI系列视频-2",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ui_3.HomePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          "Flutter精美UI系列视频-3",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ui_4.HomePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          "Flutter精美UI系列视频-4",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ui_5.HomePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          "Flutter精美UI系列视频-5",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AsyncHomePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          "Flutter 异步Widgets的使用",
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
      ),
    );
  }

  List<MainBean> imageList = [
    MainBean(
      "Flutter精美UI系列视频-1",
      "assets/images/main_1.jpg",
      MaterialPageRoute(builder: (context) => ui_1.HomePage()),
    ),
    MainBean(
      "Flutter精美UI系列视频-2",
      "assets/images/main_2.jpg",
      MaterialPageRoute(builder: (context) => ui_2.HomePage()),
    ),
    MainBean(
      "Flutter精美UI系列视频-3",
      "assets/images/main_3.jpg",
      MaterialPageRoute(builder: (context) => ui_3.HomePage()),
    ),
    MainBean(
      "Flutter精美UI系列视频-4",
      "assets/images/main_4.png",
      MaterialPageRoute(builder: (context) => ui_4.HomePage()),
    ),
    MainBean(
      "Flutter精美UI系列视频-5",
      "assets/images/main_5.png",
      MaterialPageRoute(builder: (context) => ui_5.HomePage()),
    ),
    MainBean(
      "Flutter 异步Widgets的使用",
      "assets/images/main_6.png",
      MaterialPageRoute(builder: (context) => AsyncHomePage()),
    ),
  ];

  Widget _buildWeb(BuildContext buildContext) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 50,
          top: 20,
          right: 50,
        ),
        child: Wrap(
          spacing: 30,
          children: <Widget>[
            ...imageList.map((f) => _buildWebItem(buildContext, f)).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildWebItem(BuildContext context, MainBean f) {
    double width = MediaQuery.of(context).size.width / 5;

    if (width < 100) {
      width = 100;
    }
    if (MediaQuery.of(context).size.width < 500) {
      width = MediaQuery.of(context).size.width / 3;
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(f.route);
      },
      child: Column(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                f.url,
                width: width,
                height: width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 50,
            ),
            child: Text(
              f.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainBean {
  String title;
  String url;
  Route route;

  MainBean(this.title, this.url, this.route);
}
