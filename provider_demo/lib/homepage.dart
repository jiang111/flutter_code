import 'package:flutter/material.dart';
import 'package:flutter_provider_demos/bean/ThemeModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("首页"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Consumer<String>(
              builder: (_, t, child) {
                return Text(t);
              },
            ),
            Consumer<int>(
              builder: (_, t, child) {
                return Text(t.toString());
              },
            ),
            FlatButton(
              onPressed: () {
                Provider.of<ThemeModel>(context, listen: false).reverse();
              },
              child: Consumer<ThemeModel>(
                builder: (context, t, child) {
                  String result = "切换成";
                  if (t.currentType == ThemeType.dark) {
                    result += "白天模式";
                  } else {
                    result += "夜间模式";
                  }

                  return Text(result);
                },
              ),
            ),
            FlatButton(
              onPressed: () {
                Provider.of<ThemeModel>(context, listen: false).reverse();
              },
              child: Selector<ThemeModel, ThemeType>(
                builder: (context, type, child) {
                  String result = "切换成";
                  if (type == ThemeType.dark) {
                    result += "白天模式";
                  } else {
                    result += "夜间模式";
                  }
                  return Text(result);
                },
                selector: (context, themeModel) {
                  return themeModel.currentType;
                },
                shouldRebuild: (pre, next) {
                  return pre != next;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
