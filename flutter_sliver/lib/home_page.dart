import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //SliverList
  //SliverGrid
  //SliverPadding
  //SliverAppBar
  //SliverPersistentHeader
  // SliverToBoxAdapter
  //SliverFillViewport
  //SliverFillRemaining

//  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
//    scrollController = ScrollController();
//    scrollController.addListener(() {
//      double max = scrollController.position.maxScrollExtent;
//      double current = scrollController.position.pixels;
//
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微博国际版"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2), () {
            return true;
          });
        },
        child: CustomScrollView(
//          controller: scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FlutterLogo(),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "作者:AAA",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "沙发上东方时代粉色的沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费沙发上东方时代粉色的方式地方水电费方式地方水电费 水电费收到方水电费水电费 第三方水电费啊打人问问任务人",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            SliverPersistentHeader(
              delegate: MyDelegate(),
              pinned: true,
            ),
//            SliverToBoxAdapter(
//              child: ListView.builder(
//                shrinkWrap: true,
//                itemBuilder: (context, index) {
//                  return Container(
//                    color: Colors.white,
//                    padding: EdgeInsets.all(15),
//                    child: Center(
//                        child: Text("this is a comment:" + index.toString())),
//                  );
//                },
//                itemCount: 40,
//              ),
//            ),
//            SliverList(
//              delegate: SliverChildBuilderDelegate(
//                (context, index) {
//                  return Container(
//                    color: Colors.white,
//                    padding: EdgeInsets.all(15),
//                    child: Center(
//                        child: Text("this is a comment:" + index.toString())),
//                  );
//                },
//                childCount: 50,
//              ),
//            ),

//          SliverPersistentHeader(
//            delegate: MyDelegate(),
//            pinned: true,
//          ),
//          SliverFillRemaining(
//            child: Container(
//              color: Colors.green,
//            ),
//          ),
//          SliverAppBar(
//            expandedHeight: 200,
//            floating: true,
//            snap: false,
//            pinned: true,
//            centerTitle: true,
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text("FlexibleSpaceBar"),
//              collapseMode: CollapseMode.parallax,
//              background: FlutterLogo(),
//            ),
//          ),

//          SliverFillViewport(
//            delegate: SliverChildBuilderDelegate((context, index) {
//              return Padding(
//                padding: EdgeInsets.all(15),
//                child: Text(index.toString()),
//              );
//            }),
//            viewportFraction: 0.1,
//          ),

//          SliverToBoxAdapter(
//            child: Container(
//              height: 2000,
//              color: Colors.green,
//            ),
//          ),

//          SliverList(
//            delegate: SliverChildBuilderDelegate(
//              (context, index) {
//                return Padding(
//                  padding: EdgeInsets.all(15),
//                  child: Text(index.toString()),
//                );
//              },
//              childCount: 50,
//            ),
//          ),
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 15, right: 15),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(
            "赞:1020",
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "评论:100",
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "转发:10",
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
