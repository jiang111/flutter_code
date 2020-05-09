import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/base/image_loader.dart';
import 'package:flutter_arch_demo/base/multi_state_widget.dart';
import 'package:flutter_arch_demo/base/provider_widget.dart';
import 'package:flutter_arch_demo/base/screen_utils.dart';
import 'package:flutter_arch_demo/model/theaters_bean.dart';
import 'package:flutter_arch_demo/viewmodel/theaters_viewmodel.dart';
import 'package:flutter_arch_demo/viewmodel/theme_viewmodel.dart';
import 'package:flutter_arch_demo/widget/douban_appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DouBanAppBar(title: "首页", canBack: false, actions: [
        InkWell(
          onTap: () {
            Provider.of<ThemeViewModel>(context, listen: false).changeTheme();
          },
          child: Icon(Icons.lightbulb_outline),
        ),
      ]).build(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: sHeight(300),
                child: ProviderWidget<TheatersViewModel>(
                  model: TheatersViewModel(),
                  onReady: (model) {
                    model.load();
                  },
                  builder: (context, model, child) {
                    return MultiStateWidget(
                      builder: (context) =>
                          _buildTheatersWidget(model.theatersBean),
                      state: model.state,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTheatersWidget(TheatersBean theatersBean) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "正在热映",
              style: TextStyle(
                fontSize: sSp(14),
                color: Theme.of(context).textTheme.subtitle1.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var bean = theatersBean.subjects[index];
                return Container(
                  padding: EdgeInsets.only(
                    right: sWidth(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ImageLoader(
                        bean.images.small,
                        sHeight(200),
                      ),
                      Text(
                        bean.title,
                        style: TextStyle(
                          fontSize: sSp(14),
                          color: Theme.of(context).textTheme.subtitle1.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingBar(
                        initialRating: bean.rating.average,
                        minRating: 1.0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemSize: 10,
                        itemPadding:
                            EdgeInsets.symmetric(horizontal: sWidth(3)),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                );
              },
              itemCount: theatersBean.subjects.length,
            ),
          ),
        ],
      ),
    );
  }
}
