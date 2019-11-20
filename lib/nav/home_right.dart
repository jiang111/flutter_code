import 'package:flutter/material.dart';

class HomeRightWidget extends StatefulWidget {
  @override
  _HomeRightWidgetState createState() => _HomeRightWidgetState();
}

class _HomeRightWidgetState extends State<HomeRightWidget>
    with TickerProviderStateMixin {
  TabController tabController;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1);
    tabController = TabController(length: 5, vsync: this)..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildTabBar(),
          Expanded(child: _buildPageView()),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        top: 50,
      ),
      child: Text(
        "Food & Delivery",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      labelColor: Colors.red,
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: Color(0x44B71C1C),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      unselectedLabelColor: Colors.black,
      tabs: <Widget>[
        Tab(
          text: "Asian",
        ),
        Tab(
          text: "Americans",
        ),
        Tab(
          text: "French",
        ),
        Tab(
          text: "Mexico",
        ),
        Tab(
          text: "China",
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return TabBarView(
      children: [
        BodyWidget(),
        BodyWidget(),
        BodyWidget(),
        BodyWidget(),
        BodyWidget(),
      ],
      controller: tabController,
    );
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: Text(
              "Near you",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  elevation: 5,
                  child: Container(
                    width: 250,
                    child: Image.asset(
                      "assets/images/card_1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  elevation: 5,
                  child: Container(
                    width: 250,
                    child: Image.asset(
                      "assets/images/card_1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  elevation: 5,
                  child: Container(
                    width: 250,
                    child: Image.asset(
                      "assets/images/card_1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  //设置圆角
                  elevation: 5,
                  child: Container(
                    width: 250,
                    child: Image.asset(
                      "assets/images/card_1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                  right: 20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffED305A)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
