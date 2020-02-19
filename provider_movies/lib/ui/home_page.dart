import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_movies/bean/user_bean.dart';
import 'package:flutter_provider_movies/model/user_model.dart';
import 'package:flutter_provider_movies/ui/movies_page.dart';
import 'package:flutter_provider_movies/widget/inputform.dart';
import 'package:flutter_provider_movies/widget/provider_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "登录",
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            InputFormWidget(_controller),
            ProviderWidget<UserModel>(
              builder: (context, model, child) {
                if (model.loading) {
                  return FlutterLogo();
                } else {
                  return FlatButton(
                    onPressed: () async {
                      UserBean userbean = await model.login(_controller.text);
                      UserBean pre =
                          Provider.of<UserBean>(context, listen: false);
                      pre.update(userbean);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MoviesPage()));
                    },
                    child: Text(
                        "登录:${Provider.of<UserBean>(context, listen: true).name}"),
                  );
                }
              },
              model: UserModel(Provider.of(context)),
            ),
          ],
        ),
      ),
    );
  }
}
