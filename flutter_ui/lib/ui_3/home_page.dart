import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: <Widget>[
            LeftWidget(),
            Expanded(
              child: RightWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class LeftWidget extends StatefulWidget {
  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
  List<String> _list = ["My profile", "Notifcation", "Invoice", "Home"];

  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int checkIndex = 0;

  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  Offset animationOffset = Offset(0, 0);
  late Animation _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    checkIndex = _list.length - 1;
    super.initState();

    SchedulerBinding.instance!.endOfFrame.then((value) {
      calcuteCheckOffset();
      addAnimation();
    });
  }

  void calcuteCheckOffset() {
    lastCheckOffset = checkedPositionOffset;
    RenderBox renderBox = _keys[checkIndex].currentContext!.findRenderObject() as RenderBox;
    Offset widgetOffset = renderBox.localToGlobal(Offset(0, 0));
    Size widgetSise = renderBox.size;
    checkedPositionOffset = Offset(widgetOffset.dx + widgetSise.width,
        widgetOffset.dy + widgetSise.height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 70,
            decoration: BoxDecoration(
              color: Color(0xffED305A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: _buildList(),
            ),
          ),
          Positioned(
            top: animationOffset.dy,
            left: animationOffset.dx,
            child: CustomPaint(
              painter: CheckPointPainter(Offset(10, 0)),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> WidgetList = [];

    WidgetList.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
      ),
      child: Icon(
        Icons.more_horiz,
        color: Colors.white,
        size: 30,
      ),
    ));
    WidgetList.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
      ),
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 30,
      ),
    ));
    for (int i = 0; i < _list.length; i++) {
      WidgetList.add(Expanded(
        child: GestureDetector(
            onTap: () {
              indexChecked(i);
            },
            child: VerticalText(
                _list[i],
                _keys[i],
                checkIndex == i &&
                    (_animationController != null &&
                        _animationController!.isCompleted))),
      ));
    }
    WidgetList.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
        bottom: 50,
      ),
      child: Icon(
        Icons.map,
        color: Colors.white,
        size: 30,
      ),
    ));
    return WidgetList;
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;

    setState(() {
      checkIndex = i;
      calcuteCheckOffset();
      addAnimation();
    });
  }

  void addAnimation() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(() {
            setState(() {
              animationOffset =
                  Offset(checkedPositionOffset.dx, _animation.value);
            });
          });

    _animation = Tween(begin: lastCheckOffset.dy, end: checkedPositionOffset.dy)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.easeInOutBack));
    _animationController!.forward();
  }
}

class CheckPointPainter extends CustomPainter {
  double pointRadius = 5;
  double radius = 30;

  Offset offset;

  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi;

    paint.color = Color(0xffED305A);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(offset.dx, offset.dy), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint);

    paint.color = Color(0xff98162d);
    canvas.drawCircle(
        Offset(offset.dx - pointRadius / 2, offset.dy - pointRadius / 2),
        pointRadius,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class VerticalText extends StatelessWidget {
  String name;
  bool checked;
  GlobalKey globalKey;

  VerticalText(this.name, this.globalKey, this.checked);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: 3,
      child: Text(
        name,
        style: TextStyle(
          color: checked ? Color(0xff98162d) : Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

class RightWidget extends StatefulWidget {
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Text(
              "Food & Delivery",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: SizedBox(
              height: 30,
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: Color(0xffED305A),
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Color(0x55B71C1C),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Asian",
                  ),
                  Tab(
                    text: "American",
                  ),
                  Tab(
                    text: "Franch",
                  ),
                  Tab(
                    text: "Mexico",
                  ),
                  Tab(
                    text: "Japan",
                  ),
                  Tab(
                    text: "China",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                RightBody(),
                RightBody(),
                RightBody(),
                RightBody(),
                RightBody(),
                RightBody(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Near you",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 100,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    color: Color(0xffED305A),
                    borderRadius: BorderRadius.circular(
                      30,
                    )),
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
