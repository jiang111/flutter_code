import 'package:flutter/material.dart';
import 'package:flutter_speedcode/sliver1/home_page.dart' as SliverHomePage;
import 'package:flutter_speedcode/login_page/home_page.dart' as LoginPage;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter SpeedCode"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return SliverHomePage.HomePage();
                },
              ));
            },
            title: Text(
              "TravelBlog Sliver的使用",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return LoginPage.HomePage();
                },
              ));
            },
            title: Text(
              "登录页面",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
